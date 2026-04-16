#!/bin/bash
set -e

export PORT="${PORT:-3000}"

# Start API server in background
uv run uvicorn api.main:app --host 0.0.0.0 --port 8001 &

# Start CMS (Next.js) in foreground using PORT
cd /app/cms
exec npx next start --hostname 0.0.0.0 --port "$PORT"
