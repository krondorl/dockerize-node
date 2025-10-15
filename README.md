<img src="docs/dockerize-node.svg" />

# Dockerized Node.js Hello World

A simple Hello World Node.js CLI application containerized with Docker.

## Installation

1. Clone this repository:
   ```bash
   git clone <repository-url>
   cd dockerize-node
   ```

2. Install dependencies (if any):
   ```bash
   npm install
   ```

## Development Setup

### Prerequisites

- Node.js 24.9.1 or compatible version
- npm 10.1.0 or higher (comes with Node.js 24.9.1)
- Docker (for container deployment)

### Engine Requirements

```json
"engines": {
  "node": ">=24.9.1",
  "npm": ">=10.1.0"
}
```

The project uses:
- Base image: `node:24.9.1-alpine` (minimal Node.js image)
- Type: ES Modules (`"type": "module"` in package.json)

### Local Development

To run the application locally without Docker:

```bash
node index.js
```

## Docker Commands

### Build the Docker Image

```bash
docker build -t dockerize-node .
```

### Run the Container

```bash
docker run -it dockerize-node
```

This will run the Hello World script inside the container and output the result.

The `-it` parameter is important, or else the coloring won't work.

### View Previous Container Logs

```bash
docker logs $(docker ps -a -q --filter ancestor=dockerize-node --latest)
```

## Development

1. Make changes to the code
2. Build the Docker image: `docker build -t dockerize-node .`
3. Run the container: `docker run -it dockerize-node`
4. Test your changes

## Notes

Since this is a simple CLI application that runs and exits, there's no need for port mapping or long-running container management. Each `docker run` command will:

1. Create a new container
2. Execute the Hello World script
3. Output the result
4. Exit automatically
