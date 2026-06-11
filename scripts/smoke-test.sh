```sh
#!/usr/bin/env sh

set -eu

IMAGE_NAME="${1:?Image name is required}"
CONTAINER_NAME="docker-pipeline-smoke-test"
HOST_PORT="8080"

cleanup() {
  echo "Removing smoke-test container..."

  docker rm -f "${CONTAINER_NAME}" >/dev/null 2>&1 || true
}

trap cleanup EXIT

echo "Starting container from image: ${IMAGE_NAME}"

docker run -d \
  --name "${CONTAINER_NAME}" \
  -p "${HOST_PORT}:8080" \
  "${IMAGE_NAME}"

echo "Waiting for application to start..."

ATTEMPT=1
MAX_ATTEMPTS=15

while [ "${ATTEMPT}" -le "${MAX_ATTEMPTS}" ]; do
  if curl \
    --fail \
    --silent \
    --show-error \
    "http://localhost:${HOST_PORT}/healthz"
  then
    echo ""
    echo "Smoke test passed."
    exit 0
  fi

  echo "Attempt ${ATTEMPT}/${MAX_ATTEMPTS}: application is not ready."

  sleep 2

  ATTEMPT=$((ATTEMPT + 1))
done

echo "Smoke test failed."

echo "Container logs:"
docker logs "${CONTAINER_NAME}"

exit 1
```

