# API docs development

Local development environment for the Award Force and Good Grants API documentation, powered by [Mintlify](https://mintlify.com).

## Requirements

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/)

## Setup

1. Copy the environment file and fill in your user details:

   ```bash
   cp .env.example .env
   ```

   | Variable | Description | Command to get value |
   |----------|-------------|----------------------|
   | `USER`   | Your username | `whoami` |
   | `UID`    | Your user ID  | `id -u`  |
   | `GID`    | Your group ID | `id -g`  |

2. Build the image:

   ```bash
   docker compose build
   ```

## Usage

### Helper script

Use `./docs` for the common workflows. Equivalent raw `docker compose` commands are shown alongside it below.

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
docs mint awardforce status
```

The helper accepts both full names and short aliases:

- `awardforce` or `af`
- `goodgrants` or `gg`

### Start the dev servers

```bash
# Award Force
docs awardforce
docs af
docker compose up mint-awardforce

# Good Grants
docs goodgrants
docs gg
docker compose up mint-goodgrants
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

### Mint CLI commands

Use the helper to run arbitrary Mint commands inside a specific vertical:

```bash
# Check Mint auth/session for Award Force
docs mint awardforce status
docs mint af status
docker compose run --rm --entrypoint /docs/node_modules/.bin/mint mint-awardforce status

# Run analytics for Good Grants
docs mint goodgrants analytics stats
docs mint gg analytics stats
docker compose run --rm --entrypoint /docs/node_modules/.bin/mint mint-goodgrants analytics stats
```
