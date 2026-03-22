#!/bin/bash
set -e

echo "🐳 Запуск тестов в Docker (как в CI)..."

# Сборка образа
docker build -t req-viz-test -f ecosystem_analyzer/Dockerfile .

# Запуск тестов
docker run --rm \
  -v $(pwd):/app \
  -w /app/graph \
  req-viz-test \
  poetry run pytest --cov=graph --cov=parser --cov-report=term -v

echo "✅ Проверка в Docker завершена!"