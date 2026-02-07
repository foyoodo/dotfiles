# Dotfiles

This repo uses `stow` to map subfolders into your home directory.

## Setup

Prerequisites:
1. Install [Homebrew](https://brew.sh/) if you want the script to install `stow`.

Run:
```bash
./scripts/setup.sh
```

What the script does:
1. Checks for Homebrew and prompts you to install it if missing.
2. Installs `stow` via Homebrew if it is not present.
