# Docker Build, Scan, and Publish Pipeline

A small but realistic project for explaining how to ship container images safely.

## Stack
- Docker
- GitHub Actions or Jenkins
- Trivy
- Container registry
- Kubernetes deployment target

## What this repo covers
- Dockerfile best practices
- Image build and version tagging
- Vulnerability scan before publish
- Registry push after checks pass
- Deployment handoff using the approved image tag

## Interview talking points
- Images are treated as release artifacts
- Vulnerability scans are blocking, not optional
- Versioned tags make rollback simple

## Quick flow
1. Commit code.
2. Build the image.
3. Scan the image.
4. Push only if the scan passes.
5. Deploy the exact tag that passed validation.
