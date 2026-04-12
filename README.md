# Docker Build, Scan, and Publish Pipeline

This repo is a simple container delivery project that teaches how to build an image, scan it, and publish only a trusted release.

## What you will practice

- Writing a small service for containerization
- Creating a production-style Dockerfile
- Adding a CI workflow for build and release
- Understanding where security scanning fits in the pipeline

## Tech stack

- Python
- Docker
- GitHub Actions
- Trivy-ready scan step

## Folder guide

- `app/server.py` is the demo service
- `Dockerfile` builds the image
- `.github/workflows/docker-publish.yml` contains the CI pipeline
- `scripts/scan.sh` shows the scan command you should run

## Local run

```bash
python app/server.py
```

Open:

```text
http://localhost:8080
http://localhost:8080/healthz
```

## Docker workflow

```bash
docker build -t devopsghazali/docker-build-scan-publish:local .
docker run --rm -p 8080:8080 devopsghazali/docker-build-scan-publish:local
```

## How the pipeline should work

1. Code is pushed to the repository.
2. CI checks out the code.
3. Docker image is built.
4. The image is scanned for vulnerabilities.
5. Only the approved image tag is pushed.

## Interview talking points

- Images are release artifacts, not just build outputs.
- Scanning before publishing is a shift-left control.
- A simple app is enough when the goal is to explain the pipeline clearly.

## Practice tasks

- Replace the placeholder scan step with a real Trivy command.
- Add a Docker healthcheck.
- Add a shell test for the `/healthz` endpoint.
- Publish the image to a real registry like Docker Hub or GHCR.
