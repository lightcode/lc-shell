# Use human-friendly identifiers.
zmodload zsh/terminfo
typeset -gA key_info
key_info=(
  'Control'      '\C-'
  'ControlLeft'  '\e[1;5D \e[5D \e\e[D \eOd'
  'ControlRight' '\e[1;5C \e[5C \e\e[C \eOc'
  'Escape'       '\e'
  'Meta'         '\M-'
  'Backspace'    "^?"
  'Delete'       "^[[3~"
  'F1'           "$terminfo[kf1]"
  'F2'           "$terminfo[kf2]"
  'F3'           "$terminfo[kf3]"
  'F4'           "$terminfo[kf4]"
  'F5'           "$terminfo[kf5]"
  'F6'           "$terminfo[kf6]"
  'F7'           "$terminfo[kf7]"
  'F8'           "$terminfo[kf8]"
  'F9'           "$terminfo[kf9]"
  'F10'          "$terminfo[kf10]"
  'F11'          "$terminfo[kf11]"
  'F12'          "$terminfo[kf12]"
  'Insert'       "$terminfo[kich1]"
  'Home'         "$terminfo[khome]"
  'PageUp'       "$terminfo[kpp]"
  'End'          "$terminfo[kend]"
  'PageDown'     "$terminfo[knp]"
  'Up'           "$terminfo[kcuu1]"
  'Left'         "$terminfo[kcub1]"
  'Down'         "$terminfo[kcud1]"
  'Right'        "$terminfo[kcuf1]"
  'BackTab'      "$terminfo[kcbt]"
)


# Enables terminal application mode and updates editor information.
function zle-line-init {
  # The terminal must be in application mode when ZLE is active for $terminfo
  # values to be valid.
  if (( $+terminfo[smkx] )); then
    # Enable terminal application mode.
    echoti smkx
  fi
}
zle -N zle-line-init


# Use emacs key bindings
bindkey -e

bindkey "$key_info[Control]P" history-substring-search-up
bindkey "$key_info[Control]N" history-substring-search-down
bindkey "$key_info[Up]" history-substring-search-up
bindkey "$key_info[Down]" history-substring-search-down

bindkey "$key_info[Home]" beginning-of-line
bindkey "$key_info[End]" end-of-line

bindkey "$key_info[Insert]" overwrite-mode
bindkey "$key_info[Delete]" delete-char
bindkey "$key_info[Backspace]" backward-delete-char

bindkey "$key_info[Left]" backward-char
bindkey "$key_info[Right]" forward-char

bindkey -s "$key_info[Escape]g" '^Ugws^M'

autoload -z edit-command-line
zle -N edit-command-line
bindkey "$key_info[Control]V" edit-command-line
