#!/bin/bash
set -e

# Start API server in background
uv run uvicorn api.main:app --host 0.0.0.0 --port 8001 &

# Start CMS (Next.js) in foreground
exec npm run start -w @videofy/cms -- --hostname 0.0.0.0 --port ${PORT:-3000}
