# AwardForce API Docs

Local development environment for the AwardForce API documentation, powered by [Mintlify](https://mintlify.com).

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

### Start the dev server

```bash
docker compose up mint
```

The docs will be available at [http://localhost:3000](http://localhost:3000).

> If you see an orphan container warning, run `docker compose up mint --remove-orphans` to clean it up.

### npm

Use the `npm` service to run any npm command inside the container:

```bash
# Install all dependencies
docker compose run --rm npm install

# Add a package
docker compose run --rm npm install mint

# Remove a package
docker compose run --rm npm uninstall mint

# Run an npm script
docker compose run --rm npm run <script>
```
