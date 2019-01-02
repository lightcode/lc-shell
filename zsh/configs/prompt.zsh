autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' use-simple true
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' max-exports 1
zstyle ':vcs_info:*' formats '%%B%F{2}%b%f%%b%c%u%m'
zstyle ':vcs_info:*' actionformats '%%B%F{2}%b%f%%b:%%B%F{3}%a%f%%b%c%u%m'
zstyle ':vcs_info:*' stagedstr ' %B%F{2}✚%f%b'
zstyle ':vcs_info:*' unstagedstr ' %B%F{4}✱%f%b'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked git-fix-misc git-remote git-stashed

function +vi-git-untracked() {
  if git status --porcelain | grep '?? ' &> /dev/null; then
    hook_com[staged]+=' %B%F{7}◼%f%b'
  fi
}

function +vi-git-fix-misc() {
  if (( ${#hook_com[misc]} > 0 )) && [[ "${hook_com[misc][1]}" != " " ]]; then
    hook_com[misc]=" ${hook_com[misc]}"
  fi

  case "${hook_com[action]}" in
    rebase-i|cherry)
      hook_com[misc]="${hook_com[misc][1,10]}"
    ;;
  esac
}

function +vi-git-remote() {
  local ahead behind ahead_behind

  ahead_behind="$(git rev-list --count --left-right 'HEAD...@{upstream}' 2> /dev/null)"

  if (( $? != 0 )); then
    return
  fi

  ahead="$ahead_behind[(w)1]"
  if (( $ahead > 0 )); then
    hook_com[misc]+=' %B%F{13}⇡%f%b'
  fi

  behind="$ahead_behind[(w)2]"
  if (( $behind > 0 )); then
    hook_com[misc]+=' %B%F{13}⇣%f%b'
  fi
}

function +vi-git-stashed() {
  local stashed="$(git stash list 2> /dev/null | wc -l)"

  if (( $stashed > 0 )); then
    hook_com[misc]+=' %B%F{6}✭%f%b'
  fi
}

function precmd() {
  vcs_info
  k8s_prompt
}

function k8s_prompt() {
  k8s_prompt=""
  local kubeconfig=${KUBECONFIG:-~/.kube/config}

  if [[ -f "$kubeconfig" ]]; then
    local k8s_context=$(sed -n '/current-context: / s/current-context: //p' "$kubeconfig")
    if [[ -n "$k8s_context" ]]; then
      k8s_prompt=" %F{5}($k8s_context)%f"
    fi
  fi
}


setopt PROMPT_SUBST

PROMPT='%F{4}%3~%(!. %B%F{1}#%f%b.) %B%F{1}❯%F{3}❯%F{2}❯%f%b '
RPROMPT='${vcs_info_msg_0_}${k8s_prompt}'
