#!/usr/bin/env bash

set -Eeuo pipefail

readonly DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly BACKUP_DIR="$HOME/.dotfiles-backup"

GREEN="\033[0;32m"
BLUE="\033[0;34m"
YELLOW="\033[1;33m"
RED="\033[0;31m"
RESET="\033[0m"

info() {
    echo -e "${BLUE}[INFO]${RESET} $1"
}

success() {
    echo -e "${GREEN}[ OK ]${RESET} $1"
}

warning() {
    echo -e "${YELLOW}[WARN]${RESET} $1"
}

error() {
    echo -e "${RED}[FAIL]${RESET} $1"
}

backup() {
    mkdir -p "$BACKUP_DIR"

    if [ -f "$HOME/.bashrc" ]; then
        cp "$HOME/.bashrc" "$BACKUP_DIR/.bashrc.backup"
        success "Backed up existing .bashrc"
    fi
}

install_bashrc() {
    cp "$DOTFILES_DIR/bash/.bashrc" "$HOME/.bashrc"
    success "Installed .bashrc"
}

main() {
    info "Installing dotfiles..."

    backup
    install_bashrc

    success "Installation complete."
}

main "$@"
