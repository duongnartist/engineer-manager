#!/bin/bash
# Script cài đặt tool cho iOS team: SwiftLint, codespell, git-secrets

echo "⚙️ Cài công cụ cho iOS..."

# ---------- SwiftLint ----------
if ! command -v swiftlint >/dev/null 2>&1; then
  echo "➡️ Cài SwiftLint..."
  brew install swiftlint
else
  echo "✅ SwiftLint đã có."
fi

# ---------- Spelling check ----------
if ! command -v codespell >/dev/null 2>&1; then
  echo "➡️ Cài codespell..."
  brew install codespell || pip install codespell
else
  echo "✅ codespell đã có."
fi

# ---------- Security check ----------
if ! command -v git-secrets >/dev/null 2>&1; then
  echo "➡️ Cài git-secrets..."
  brew install git-secrets
else
  echo "✅ git-secrets đã có."
fi

echo "🎉 iOS tools đã sẵn sàng!"