#!/bin/bash
set -e

cd "$(dirname "$0")"

echo "==> Building images..."
docker compose build

echo "==> Restarting services..."
docker compose up -d --remove-orphans

echo "==> Cleaning up old images..."
docker image prune -f

echo ""
echo "Done. Services:"
docker compose ps
