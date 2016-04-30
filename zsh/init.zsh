lcs_zsh=$0:A:h

#
# load default configuration
#

source ${lcs_zsh}/zprezto-config.zsh


#
# load zprezto
#

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

source ${lcs_zsh}/after-zprezto.zsh

#
# source all files in ~/.zshrc.d
#

for script (${HOME}/.zshrc.d/*(N)); source "$script"

unset lcs_zsh script
