#!/bin/zsh

function update-lc-shell() {
  local lcshell_setup="${HOME}/lc-shell/setup.sh"
  "$lcshell_setup" -u
}
