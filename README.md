# Linux Performance Evidence

This repository contains the Ubuntu Docker environment and the text evidence collected for the Linux performance test.

## Requirement

Install and start Docker Desktop on macOS before using the commands below.

## Build and enter the Ubuntu container

Run these commands from this repository directory:

```zsh
docker build -t linux-performance-tp:local .
docker run --rm -it \
  --mount "type=bind,source=$PWD,target=/work,readonly" \
  --workdir /work \
  linux-performance-tp:local
```

The second command opens a Bash session directly inside Ubuntu at `/work`.

## Useful commands inside the container

```bash
ls evidence
cat evidence/sistema_linux.txt
mkdir -p /tmp/tp-video
cd /tmp/tp-video
```

Use `exit` to leave the container. The `--rm` option removes the temporary container, and the read-only mount keeps the repository unchanged.
