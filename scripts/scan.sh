#!/usr/bin/env sh
set -eu

IMAGE_NAME="${1:?Image name is required}"

echo "Scanning image: ${IMAGE_NAME}"

trivy image \
  --severity HIGH,CRITICAL \
  --exit-code 1 \
  --ignore-unfixed \
  --no-progress \
  "${IMAGE_NAME}"

echo "Trivy scan passed."
