#!/usr/bin/env bash

set -euo pipefail

REPOSITORY_URL="https://github.com/neotechnique/neotechnique.git"
REPOSITORY_DIR="${HOME}/neotechnique"

if [[ -d "${REPOSITORY_DIR}/.git" ]]; then
  git -C "${REPOSITORY_DIR}" pull --ff-only
elif [[ -e "${REPOSITORY_DIR}" ]]; then
  printf 'Cannot clone: %s exists but is not a Git repository.\n' "${REPOSITORY_DIR}" >&2
  exit 1
else
  git clone "${REPOSITORY_URL}" "${REPOSITORY_DIR}"
fi
