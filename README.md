# Docker Build, Scan, and Publish Pipeline

This repo shows a practical container release flow:

- Build a Docker image
- Run a vulnerability scan
- Publish only the approved tag
- Keep the deployment target separate from the app source

## What is inside

- A tiny Python service with health and info endpoints
- A production-style Dockerfile
- A GitHub Actions workflow
- A sample scan script

## Run locally

```bash
python app/server.py
```

## Build the image

```bash
docker build -t devopsghazali/docker-build-scan-publish:local .
```

## Main files

- `app/server.py`
- `Dockerfile`
- `.github/workflows/docker-publish.yml`
- `scripts/scan.sh`
