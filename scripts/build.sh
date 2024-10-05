#!/bin/bash
set -eu

# Global vars
SCRIPT_PATH="$(dirname "$(realpath "$0")")"
PROJECT_ROOT="$(realpath "${SCRIPT_PATH}"/..)"
PROJECT_NAME="${PROJECT_ROOT##*/}"

podman tag "${PROJECT_NAME}":latest "${PROJECT_NAME}":previous || true
podman build \
  --label project="${PROJECT_NAME}" \
  -t "${PROJECT_NAME}":latest \
  -f "${PROJECT_ROOT}"/containerfile \
  "${PROJECT_ROOT}"
podman rmi -f "${PROJECT_NAME}":previous
