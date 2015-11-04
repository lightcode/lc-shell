#!/bin/bash

set -e

declare -r TMUX_CONF_PATH="${HOME}/.tmux.conf"
declare -r VIMRC_PATH="${HOME}/.vimrc"
declare -r ZSHRC_PATH="${HOME}/.zshrc"
declare -r ZSH_DROPIN_DIR="${HOME}/.zsh.d"

declare -r ROOT=$(dirname $(realpath $0))

_install_link() {
  local src="$1" dest="$2"

  if [ -L "$dest" ]; then
    rm -f "$dest"
  fi
  ln -s "$src" "$dest"
  echo >&2 " * Create link: $src -> $dest"
}

_install_dir() {
  local path="$1"

  if [ ! -d "$path" ]; then
    mkdir -p "$path" && echo >&2 " * Create directory: $path"
  fi
}

_setup_vim() {
  _install_link "${ROOT}/vim/vimrc" "$VIMRC_PATH"
}

_setup_zsh() {
  _install_dir "${ZSH_DROPIN_DIR}"
  _install_link "${ROOT}/zsh/zshrc" "$ZSHRC_PATH"

  # Install zprezto
  _install_link "${ROOT}/prezto/runcoms/zlogin" ".zlogin"
  _install_link "${ROOT}/prezto/runcoms/zlogout" ".zlogout"
  _install_link "${ROOT}/prezto/runcoms/zpreztorc" ".zpreztorc"
  _install_link "${ROOT}/prezto/runcoms/zprofile" ".zprofile"
  _install_link "${ROOT}/prezto/runcoms/zshenv" ".zshenv"
  _install_link "${ROOT}/prezto/runcoms/zshrc" ".zshrc"
}

_setup_tmux() {
  _install_link "${ROOT}/tmux/tmux.conf" "$TMUX_CONF_PATH"
}


_setup_vim
_setup_zsh
_setup_tmux
