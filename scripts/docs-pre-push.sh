#!/usr/bin/env bash

set -euo pipefail

# Keep Redocly lint advisory by default until the existing bundled specs are
# cleaned up. Set DOCS_HOOK_STRICT_LINT=1 to make lint failures block pushes.
STRICT_LINT="${DOCS_HOOK_STRICT_LINT:-0}"

# Keep the tracked bundle directories in one place so the drift check below is
# easier to read and update.
BUNDLE_PATHS=(
  awardforce-docs/api-reference
  goodgrants-docs/api-reference
)

# Regenerate all committed OpenAPI bundles before validating so the push cannot
# succeed with stale deploy artifacts.
echo "husky(pre-push): regenerating bundled OpenAPI specs"
./docs openapi

# Block the push if regeneration changed tracked bundle outputs; the developer
# should review and commit those generated artifacts explicitly.
if ! git diff --quiet -- "${BUNDLE_PATHS[@]}"; then
  echo "husky(pre-push): bundled OpenAPI specs changed during regeneration." >&2
  echo "Run './docs openapi', review the updated api-reference/openapi-*.yaml files, and commit them before pushing." >&2
  git status --short -- "${BUNDLE_PATHS[@]}" >&2
  exit 1
fi

# Run Mintlify validation for both docs sites as the main blocking quality gate.
echo "husky(pre-push): validating Mintlify docs builds"
./docs validate

# Run Redocly lint as a secondary signal. This is informative today, but the
# hook can be made strict later via DOCS_HOOK_STRICT_LINT=1.
echo "husky(pre-push): linting bundled OpenAPI specs"

if ! ./docs openapi-lint; then
  if [[ "$STRICT_LINT" == "1" ]]; then
    echo "husky(pre-push): Redocly lint failed and strict lint is enabled." >&2
    exit 1
  fi

  echo "husky(pre-push): Redocly lint is currently advisory because the existing bundled specs still have known lint failures." >&2
fi
