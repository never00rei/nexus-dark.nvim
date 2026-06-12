#!/usr/bin/env bash
set -euo pipefail

theme_name="nexus-dark"
mode="link"
force=0
target=""

usage() {
  cat <<'EOF'
Install nexus-dark for Neovim.

Usage:
  ./install.sh [options]

Options:
  --link          Symlink this repo into Neovim packages (default)
  --copy          Copy this repo into Neovim packages
  --target PATH   Install to a custom path
  --force         Replace an existing target
  -h, --help      Show this help

Default target:
  ${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/pack/themes/start/nexus-dark

After install:
  vim.cmd.colorscheme("nexus-dark")
EOF
}

while [ "$#" -gt 0 ]; do
  case "$1" in
    --link)
      mode="link"
      ;;
    --copy)
      mode="copy"
      ;;
    --target)
      if [ "$#" -lt 2 ]; then
        echo "error: --target requires a path" >&2
        exit 1
      fi
      target="$2"
      shift
      ;;
    --force)
      force=1
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "error: unknown option: $1" >&2
      usage >&2
      exit 1
      ;;
  esac
  shift
done

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

if [ -z "$target" ]; then
  data_home="${XDG_DATA_HOME:-$HOME/.local/share}"
  target="$data_home/nvim/site/pack/themes/start/$theme_name"
fi

parent_dir="$(dirname -- "$target")"

if [ -e "$target" ] || [ -L "$target" ]; then
  existing_target=""
  if [ -L "$target" ]; then
    existing_target="$(readlink "$target")"
  fi

  if [ "$mode" = "link" ] && [ "$existing_target" = "$script_dir" ]; then
    echo "$theme_name is already installed at $target"
    exit 0
  fi

  if [ "$force" -ne 1 ]; then
    echo "error: target already exists: $target" >&2
    echo "Use --force to replace it, or --target PATH to install elsewhere." >&2
    exit 1
  fi

  rm -rf -- "$target"
fi

mkdir -p -- "$parent_dir"

case "$mode" in
  link)
    ln -s -- "$script_dir" "$target"
    ;;
  copy)
    mkdir -p -- "$target"
    tar \
      --exclude='.git' \
      --exclude='.nvimlog' \
      -C "$script_dir" \
      -cf - . | tar -C "$target" -xf -
    ;;
esac

echo "Installed $theme_name to $target"
echo 'Add this to your Neovim config: vim.cmd.colorscheme("nexus-dark")'
