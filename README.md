# API docs development

Local development environment for the Award Force and Good Grants API documentation, powered by [Mintlify](https://mintlify.com).

## Requirements

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/)

## Setup

1. Optional: copy the environment file if you want to override the default Mint dev ports:

   ```bash
   cp .env.example .env
   ```

   By default the `docs` helper auto-detects your host user, UID, and GID for Docker builds, so you do not need to set those values in `.env` when using `./docs`.

   If you want to run raw `docker compose` commands directly instead of the helper, add these values to `.env`:

   | Variable | Description | Command to get value |
   |----------|-------------|----------------------|
   | `HOST_USER` | Your username | `id -un` |
   | `HOST_UID`  | Your user ID  | `id -u`  |
   | `HOST_GID`  | Your group ID | `id -g`  |

2. Build the image:

   ```bash
   ./docs build
   ```

   If you want to run raw `docker compose build` directly instead of `./docs build`, either set the `HOST_*` values in `.env` as shown above or export them inline:

   ```bash
   HOST_USER="$(id -un)" HOST_UID="$(id -u)" HOST_GID="$(id -g)" docker compose build
   ```

## Usage

### Helper script

Use `./docs` for the common workflows. Equivalent raw `docker compose` commands are shown alongside it below.

`./docs` automatically exports `HOST_USER`, `HOST_UID`, and `HOST_GID` for Compose-based commands so container builds run as your local user by default. If you use the raw `docker compose` commands shown below instead, define those values in `.env` or export them inline first.

Run `./docs help` to see all supported commands.

If you want to call it as `docs` from anywhere, add the repo directory to your `PATH` in `.zshrc` or `.bashrc`:

```bash
export PATH="/absolute/path/to/apidocs-awardforce:$PATH"
```

Replace `/absolute/path/to/apidocs-awardforce` with the path to your local clone.

After editing your shell config, reload it:

```bash
source ~/.zshrc
# or
source ~/.bashrc
```

If you do not add the repo directory to your `PATH`, you can still use the script directly as `./docs` from the repo root.

Then you can run commands like:

```bash
docs npm --version
docs awardforce
docs af
docs goodgrants
docs gg
docs validate
docs openapi-lint gg
```

The helper accepts both full names and short aliases:

- `awardforce` or `af`
- `goodgrants` or `gg`

### Start the dev servers

```bash
# Award Force
docs awardforce
docs af
docker compose up awardforce

# Good Grants
docs goodgrants
docs gg
docker compose up goodgrants
```

The docs will be available at:

- Award Force: [http://localhost:3000](http://localhost:3000)
- Good Grants: [http://localhost:3001](http://localhost:3001)

To start both at once:

```bash
docs all
docker compose up
```

If you see an orphan container warning, run either `docs all --remove-orphans` or `docker compose up --remove-orphans` to clean it up.

### npm

Use the `npm` service to run any npm command inside the container:

```bash
# Install all dependencies
docs npm install
docker compose run --rm npm install

# Add a package
docs npm install mint
docker compose run --rm npm install mint

# Remove a package
docs npm uninstall mint
docker compose run --rm npm uninstall mint

# Show npm version
docs npm --version
docker compose run --rm npm --version
```

### Validate the docs build

```bash
# Validate one docs site
docs validate af

# Validate both docs sites
docs validate
```

### OpenAPI workflows

```bash
# Rebuild bundled OpenAPI files from src/
docs openapi af
docs openapi

# Lint generated bundled OpenAPI files with Redocly
docs openapi-lint gg
docs openapi-lint

# Remove generated bundled OpenAPI files
docs openapi-clean af
docs openapi-clean
```

The bundled files under `api-reference/openapi-*.yaml` are generated from `src/` and committed to git because Mintlify deploys from repository contents and `docs.json` references those bundled files directly.

`docs openapi-lint` lints the generated files under `api-reference/openapi-*.yaml`.
If those bundles do not exist yet, run `docs openapi` first.

When you change OpenAPI source files under `src/`, regenerate the matching bundles with `docs openapi` and commit both the source changes and the updated `api-reference/` outputs together.
