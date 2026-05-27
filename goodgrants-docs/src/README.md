Versioned OpenAPI source files
===========

- Each version directory contains a self-contained versioned source spec layout.
- Keep root version entrypoints in version directories, for example `v2_2/openapi.yaml`.
- Keep version-local reusable components in each version's `components/` directory.
- Bundled deployable specs are generated into `../api-reference/`.
