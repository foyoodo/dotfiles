#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SPOONS_DIR="$ROOT/hammerspoon/.hammerspoon/Spoons"
SPOONS_REPO="https://github.com/Hammerspoon/Spoons/raw/master/Spoons"
SPOONINSTALL_ZIP="${SPOONS_REPO}/SpoonInstall.spoon.zip"

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew is not installed. Please install Homebrew first:"
  echo "  https://brew.sh/"
  exit 1
fi

if ! command -v stow >/dev/null 2>&1; then
  brew install stow
fi

if ! command -v curl >/dev/null 2>&1; then
  echo "curl is required but not found."
  exit 1
fi

if ! command -v unzip >/dev/null 2>&1; then
  echo "unzip is required but not found."
  exit 1
fi

mkdir -p "$SPOONS_DIR"
tmp_dir="$(mktemp -d)"
zip_path="$tmp_dir/SpoonInstall.spoon.zip"

curl -fsSL "$SPOONINSTALL_ZIP" -o "$zip_path"
unzip -q "$zip_path" -d "$tmp_dir"

spoon_path="$(find "$tmp_dir" -maxdepth 2 -type d -name "SpoonInstall.spoon" | head -n 1)"
if [[ -z "$spoon_path" ]]; then
  echo "Failed to locate SpoonInstall.spoon after unzip."
  exit 1
fi

rm -rf "$SPOONS_DIR/SpoonInstall.spoon"
mv "$spoon_path" "$SPOONS_DIR/"

stow -d "$ROOT" -t "$HOME" hammerspoon

echo "Done. Reload Hammerspoon to install and activate Spoons via SpoonInstall."
