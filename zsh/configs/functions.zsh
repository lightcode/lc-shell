function reloadzsh() {
  if [[ -s "${ZDOTDIR:-$HOME}/.zshenv" ]]; then
    source "${ZDOTDIR:-$HOME}/.zshenv"
  fi

  if [[ -s "${ZDOTDIR:-$HOME}/.zshrc" ]]; then
    source "${ZDOTDIR:-$HOME}/.zshrc"
  fi

  rehash
}
