#!/usr/bin/env bash
# Deploy da landing Neurocalc no VPS.
# Uso: rode dentro da pasta do repositorio no servidor:  bash deploy.sh
set -euo pipefail
cd "$(dirname "$0")"

echo ">> Atualizando codigo (git pull)..."
git pull --ff-only

echo ">> Reconstruindo e subindo o container..."
docker compose up -d --build

echo ">> Limpando imagens antigas..."
docker image prune -f

echo ">> Estado atual:"
docker compose ps
echo ">> Deploy concluido."
