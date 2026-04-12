#!/usr/bin/env sh
set -eu

IMAGE_NAME="${1:-devopsghazali/docker-build-scan-publish:local}"
echo "Scan image with Trivy:"
echo "trivy image ${IMAGE_NAME}"
