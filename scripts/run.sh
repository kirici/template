#!/bin/bash
set -eu

# Global vars
SCRIPT_PATH="$(dirname "$(realpath "$0")")"
PROJECT_ROOT="$(realpath "${SCRIPT_PATH}"/..)"
PROJECT_NAME="${PROJECT_ROOT##*/}"

. "${PROJECT_ROOT}"/.env

podman run \
  -td \
  --replace \
  -e PORT="${PORT}" \
  -p "${PORT_HOST}":"${PORT}" \
  --name "${PROJECT_NAME}" \
  "${PROJECT_NAME}":latest
