#!/bin/bash
# Script cài đặt tool cho Flutter team: Dart format, Dart analyze, codespell, git-secrets

echo "⚙️ Cài công cụ cho Flutter..."

# ---------- Dart / Flutter ----------
if command -v dart >/dev/null 2>&1; then
  echo "✅ Dart/Flutter đã có: $(dart --version)"
else
  echo "⚠️ Flutter chưa được cài. Vui lòng cài Flutter SDK: https://docs.flutter.dev/get-started/install"
fi

# ---------- Spelling check ----------
if ! command -v codespell >/dev/null 2>&1; then
  echo "➡️ Cài codespell..."
  if [ "$(uname -s)" = "Darwin" ]; then
    brew install codespell
  else
    pip install codespell
  fi
else
  echo "✅ codespell đã có."
fi

# ---------- Security check ----------
if ! command -v git-secrets >/dev/null 2>&1; then
  echo "➡️ Cài git-secrets..."
  if [ "$(uname -s)" = "Darwin" ]; then
    brew install git-secrets
  else
    git clone https://github.com/awslabs/git-secrets.git
    cd git-secrets && sudo make install && cd ..
    rm -rf git-secrets
  fi
else
  echo "✅ git-secrets đã có."
fi

echo "🎉 Flutter tools đã sẵn sàng!"