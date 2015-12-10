#!/bin/bash

set -e

declare -r TMUX_CONF_PATH="${HOME}/.tmux.conf"
declare -r VIMRC_PATH="${HOME}/.vimrc"
declare -r ZSHRC_PATH="${HOME}/.zshrc"
declare -r ZSH_DROPIN_DIR="${HOME}/.zsh.d"

declare -r ROOT=$(dirname $(realpath $0))

declare -i UPDATE=0


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


_setup_lcshell() {
  if [ "$UPDATE" -eq 1 ]; then
    echo >&2 -e "Trying to update this repo...\n"
    git -C "$ROOT" pull -q || true
    echo >&2
  fi
}

_setup_vim() {
  _install_link "${ROOT}/vim/vimrc" "$VIMRC_PATH"

  _install_dir "${HOME}/.vim/bundle"

  echo >&2
  if [ -d "${HOME}/.vim/bundle/Vundle.vim" ] && [ "$UPDATE" -eq 1 ]; then
    echo >&2 -e "Updating Vundle...\n"
    git -C "${HOME}/.vim/bundle/Vundle.vim" pull --depth=1 -q || true
  elif [ ! -d "${HOME}/.vim/bundle/Vundle.vim" ]; then
    echo >&2 -e "Installing Vundle...\n"
    git clone --depth=1 https://github.com/gmarik/Vundle.vim.git "${HOME}/.vim/bundle/Vundle.vim"
  fi
  echo >&2

  vim +PluginClean\! +qall
  vim +PluginInstall +qall

  if [ "$UPDATE" -eq 1 ]; then
    vim +PluginUpdate +qall
  fi
}

_setup_zsh() {
  _install_dir "${ZSH_DROPIN_DIR}"
  _install_link "${ROOT}/zsh/zshrc" "$ZSHRC_PATH"

  # Install zprezto
  echo >&2
  if [ -d "${ZDOTDIR:-$HOME}/.zprezto" ] && [ "$UPDATE" -eq 1 ]; then
    echo >&2 -e "Updating Zprezto...\n"
    git -C "${ZDOTDIR:-$HOME}/.zprezto" pull --depth=1 || true
  elif [ ! -d "${ZDOTDIR:-$HOME}/.zprezto" ]; then
    echo >&2 -e "Installing Zprezto...\n"
    git clone --depth=1 --recursive https://github.com/lightcode/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  fi
  echo >&2

  for file in zlogin zlogout zprofile zshenv; do
    _install_link "${ZDOTDIR:-$HOME}/.zprezto/runcoms/$file" "${HOME}/.$file"
  done

  _install_link "${ROOT}/zsh/zpreztorc" "${HOME}/.zpreztorc"

  _install_link "${ROOT}/lc-shell/update-lc-shell.zsh" "${ZSH_DROPIN_DIR}/update-lc-shell.zsh"
}

_setup_tmux() {
  _install_link "${ROOT}/tmux/tmux.conf" "$TMUX_CONF_PATH"
}


_main() {

  while getopts u opt; do
    case "$opt" in
      u) UPDATE=1 ;;
      [?]) echo >&2 "Usage: $0 [-u]"
           exit 1;;
    esac
  done

  _setup_lcshell
  _setup_vim
  _setup_zsh
  _setup_tmux
}

_main "$*"
