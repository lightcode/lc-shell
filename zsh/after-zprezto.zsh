#
# Alias
#

alias l='k -h --no-vcs'
alias ll='k -hA --no-vcs'

#
# ZLE
#

# alt+g: execute 'git status'
bindkey -s '\eg' '^Ugws^M'

#
# Function to reload ZSH
#

function reloadzsh() {
  if [[ -s "${ZDOTDIR:-$HOME}/.zshenv" ]]; then
    source "${ZDOTDIR:-$HOME}/.zshenv"
  fi

  if [[ -s "${ZDOTDIR:-$HOME}/.zshrc" ]]; then
    source "${ZDOTDIR:-$HOME}/.zshrc"
  fi

  rehash
}

function update-lc-shell() {
  local lcshell_setup="${HOME}/.lc-shell/setup.sh"
  "$lcshell_setup" -u
}
