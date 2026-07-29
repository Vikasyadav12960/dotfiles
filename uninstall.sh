#!/usr/bin/env bash

set -Eeuo pipefail

GREEN="\033[0;32m"
BLUE="\033[0;34m"
RED="\033[0;31m"
RESET="\033[0m"

readonly BACKUP_DIR="$HOME/.dotfiles-backup"

info() {
    echo -e "${BLUE}[INFO]${RESET} $1"
}

success() {
    echo -e "${GREEN}[ OK ]${RESET} $1"
}

error() {
    echo -e "${RED}[FAIL]${RESET} $1"
}

restore() {
    if [[ -f "$BACKUP_DIR/.bashrc.backup" ]]; then
        cp "$BACKUP_DIR/.bashrc.backup" "$HOME/.bashrc"
        success "Restored original .bashrc"
    else
        info "No backup found."
    fi
}

main() {
    info "Removing dotfiles..."

    restore

    success "Done."
}

main "$@"
