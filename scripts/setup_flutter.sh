#!/bin/bash
set -e

HOOKS_SRC="$(cd "$(dirname "$0")/configs" && pwd)"

if [ -z "$1" ]; then
  echo "❌ Missing Flutter project path. Usage: ./setup-flutter.sh /path/to/flutter-project"
  exit 1
fi

PROJECT_ROOT="$(cd "$1" && pwd)"

echo "📦 Copying .editorconfig..."
cp -f "$HOOKS_SRC/.editorconfig" "$PROJECT_ROOT/.editorconfig"

echo "⚙️ Setting up Flutter lint configs..."
mkdir -p "$PROJECT_ROOT/configs/flutter"
cp -f "$HOOKS_SRC/flutter/analysis_options.yaml" "$PROJECT_ROOT/analysis_options.yaml"

echo "✅ Flutter config setup complete for $PROJECT_ROOT"