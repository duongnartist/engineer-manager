#!/bin/bash
set -e

if [ -z "$1" ]; then
  echo "❌ Missing Flutter project path. Usage: ./setup-flutter.sh /path/to/flutter-project"
  exit 1
fi

HOOKS_SRC="configs"
PROJECT_ROOT=$1

echo "📦 Copying .editorconfig..."
cp -f "$HOOKS_SRC/.editorconfig" "$PROJECT_ROOT/.editorconfig"

echo "⚙️ Setting up Flutter lint configs..."
cp -f "$HOOKS_SRC/flutter/analysis_options.yaml" "$PROJECT_ROOT/analysis_options.yaml"

echo "✅ Flutter config setup complete for $PROJECT_ROOT"