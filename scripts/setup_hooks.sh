#!/bin/bash
# setup-hooks.sh
# Script cài đặt/gỡ Git pre-commit hook cho Android, iOS, Flutter
# HOOKS_SRC luôn cố định tại ./hooks trong repo này

set -e

# Nhận đường dẫn project từ tham số (bỏ qua option install/uninstall), mặc định là thư mục hiện tại
MODE="install"
if [[ "$1" == "--uninstall" ]]; then
  MODE="uninstall"
  shift
elif [[ "$1" == "--install" ]]; then
  MODE="install"
  shift
fi

PROJECT_PATH=${1:-.}
HOOKS_DIR="$PROJECT_PATH/.git/hooks"
HOOKS_SRC="./hooks"

echo "-----------------------------------"
echo "🔧 Git hooks manager"
echo "Mode         : $MODE"
echo "Project path : $PROJECT_PATH"
echo "Hooks dir    : $HOOKS_DIR"
echo "Hooks source : $HOOKS_SRC"
echo "-----------------------------------"

if [[ "$MODE" == "uninstall" ]]; then
  # Gỡ bỏ pre-commit hook
  if [ -f "$HOOKS_DIR/pre-commit" ]; then
    rm "$HOOKS_DIR/pre-commit"
    echo "✅ Đã gỡ bỏ pre-commit hook khỏi $PROJECT_PATH"
  else
    echo "ℹ️ Không tìm thấy pre-commit hook trong $PROJECT_PATH"
  fi
  exit 0
fi

# Nếu là install
echo "Chọn team của bạn:"
echo "1) Android"
echo "2) iOS"
echo "3) Flutter"
read -p "Nhập số (1-3): " choice

case $choice in
  1)
    PRE_COMMIT_FILE="$HOOKS_SRC/pre-commit-android"
    ;;
  2)
    PRE_COMMIT_FILE="$HOOKS_SRC/pre-commit-ios"
    ;;
  3)
    PRE_COMMIT_FILE="$HOOKS_SRC/pre-commit-flutter"
    ;;
  *)
    echo "❌ Lựa chọn không hợp lệ."
    exit 1
    ;;
esac

# Kiểm tra file tồn tại
if [ ! -f "$PRE_COMMIT_FILE" ]; then
  echo "❌ Không tìm thấy file $PRE_COMMIT_FILE"
  exit 1
fi

# Copy vào .git/hooks/pre-commit
cp "$PRE_COMMIT_FILE" "$HOOKS_DIR/pre-commit"
chmod +x "$HOOKS_DIR/pre-commit"

echo "✅ Pre-commit hook đã được cài đặt cho team $(basename "$PRE_COMMIT_FILE")"
echo "📂 Project path: $PROJECT_PATH"