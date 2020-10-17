# Prompt before doing something
alias cp="${aliases[cp]:-cp} -i"
alias ln="${aliases[ln]:-ln} -i"
alias mv="${aliases[mv]:-mv} -i"
alias rm="${aliases[rm]:-rm} -i"

alias ls="${aliases[ls]:-ls} --color=auto"
alias grep="${aliases[grep]:-grep} --color=auto"

if (( $+commands[nvim] )); then
  alias vi='nvim'
  alias vim='nvim'
fi

if (( $+commands[exa] )) ; then
  alias l='exa -lg'
  alias ll='l -a'
else
  alias l='ls -lh'
  alias ll='l -A'
fi

alias df='df -kh'
alias du='du -kh'

alias g='git'
alias gc='git commit --verbose'
alias gl='git log --topo-order --pretty=format:"%C(bold)Commit:%C(reset) %C(green)%H%C(red)%d%n%C(bold)Author:%C(reset) %C(cyan)%an <%ae>%n%C(bold)Date:%C(reset)   %C(blue)%ai (%ar)%C(reset)%n%+B"'
alias gls='gl --graph --pretty=oneline --abbrev-commit'
alias gp='git push'
alias gws='git status --ignore-submodules=none --short'

for index ({1..9}) alias "$index"="cd +${index}"; unset index
