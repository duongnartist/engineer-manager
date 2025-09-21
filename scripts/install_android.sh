#!/bin/bash
# Script cài đặt tool cho Android team: ktlint, detekt, codespell, git-secrets

echo "⚙️ Cài công cụ cho Android..."

# Detect OS
OS="$(uname -s)"
case "${OS}" in
    Darwin*)    platform="mac";;
    Linux*)     platform="linux";;
    *)          platform="other"
esac

# ---------- ktlint ----------
if ! command -v ktlint >/dev/null 2>&1; then
  echo "➡️ Cài ktlint..."
  if [ "$platform" = "mac" ]; then
    brew install ktlint
  elif [ "$platform" = "linux" ]; then
    curl -sSLO https://github.com/pinterest/ktlint/releases/latest/download/ktlint
    chmod a+x ktlint && sudo mv ktlint /usr/local/bin/
  fi
else
  echo "✅ ktlint đã có."
fi

# ---------- detekt ----------
if ! command -v detekt >/dev/null 2>&1; then
  echo "➡️ Cài detekt..."
  if [ "$platform" = "mac" ]; then
    brew install detekt
  elif [ "$platform" = "linux" ]; then
    curl -sSLO https://github.com/detekt/detekt/releases/latest/download/detekt
    chmod a+x detekt && sudo mv detekt /usr/local/bin/
  fi
else
  echo "✅ detekt đã có."
fi

# ---------- Spelling check ----------
if ! command -v codespell >/dev/null 2>&1; then
  echo "➡️ Cài codespell..."
  if [ "$platform" = "mac" ]; then
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
  if [ "$platform" = "mac" ]; then
    brew install git-secrets
  elif [ "$platform" = "linux" ]; then
    git clone https://github.com/awslabs/git-secrets.git
    cd git-secrets && sudo make install && cd ..
    rm -rf git-secrets
  fi
else
  echo "✅ git-secrets đã có."
fi

echo "🎉 Android tools đã sẵn sàng!"