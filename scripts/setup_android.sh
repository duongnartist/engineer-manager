#!/bin/bash
set -e

HOOKS_SRC="$(cd "$(dirname "$0")/configs" && pwd)"

if [ -z "$1" ]; then
  echo "❌ Missing Android project path. Usage: ./setup-android.sh /path/to/android-project"
  exit 1
fi

PROJECT_ROOT="$(cd "$1" && pwd)"

echo "📦 Copying .editorconfig..."
cp -f "$HOOKS_SRC/.editorconfig" "$PROJECT_ROOT/.editorconfig"

echo "⚙️ Setting up Android lint configs..."
mkdir -p "$PROJECT_ROOT/configs/android"
cp -f "$HOOKS_SRC/android/detekt.yml" "$PROJECT_ROOT/configs/android/detekt.yml"
cp -f "$HOOKS_SRC/android/ktlint.gradle.kts" "$PROJECT_ROOT/configs/android/ktlint.gradle.kts"

echo "✅ Android config setup complete for $PROJECT_ROOT"