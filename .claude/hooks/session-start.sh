#!/bin/bash
# Cloud sessions only: install puppeteer-core so sloplint --render, capture.mjs
# and picture.mjs can drive the container's Chromium.
set -euo pipefail

if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

# A global install fills no git-ignored folder, so check for the package itself
if ! npm ls -g puppeteer-core >/dev/null 2>&1; then
  npm install -g puppeteer-core --no-fund --no-audit
fi
