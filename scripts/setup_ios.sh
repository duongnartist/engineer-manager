#!/bin/bash
set -e

HOOKS_SRC="$(cd "$(dirname "$0")/configs" && pwd)"

if [ -z "$1" ]; then
  echo "❌ Missing iOS project path. Usage: ./setup-ios.sh /path/to/ios-project"
  exit 1
fi

PROJECT_ROOT="$(cd "$1" && pwd)"

echo "📦 Copying .editorconfig..."
cp -f "$HOOKS_SRC/.editorconfig" "$PROJECT_ROOT/.editorconfig"

echo "⚙️ Setting up iOS lint configs..."
mkdir -p "$PROJECT_ROOT/configs/ios"
cp -f "$HOOKS_SRC/ios/.swiftlint.yml" "$PROJECT_ROOT/configs/ios/.swiftlint.yml"
cp -f "$HOOKS_SRC/ios/.swiftformat" "$PROJECT_ROOT/configs/ios/.swiftformat"

echo "✅ iOS config setup complete for $PROJECT_ROOT"