function toon {
  echo -n ""
}

get_git_dirty() {
  git diff --quiet || echo '*'
}

autoload -Uz vcs_info
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%F{red}*'   # display this when there are unstaged changes
zstyle ':vcs_info:*' stagedstr '%F{yellow}+'  # display this when there are staged changes
zstyle ':vcs_info:*' actionformats \
    '%F{5}%F{5}[%F{2}%b%F{3}|%F{1}%a%c%u%F{5}]%f'
zstyle ':vcs_info:*' formats       \
    '%F{5}%F{blue}[%F{2}%b%c%u%F{blue}]%f'
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
zstyle ':vcs_info:*' enable git cvs svn

theme_precmd () {
    vcs_info
}

setopt prompt_subst

PROMPT='%{$fg[blue]%}$(toon)%{$reset_color%} %~/%{$reset_color%}
▶ '

RPROMPT='%{$(echotc UP 1)%} ${vcs_info_msg_0_} %{$(echotc DO 1)%}'

autoload -U add-zsh-hook
add-zsh-hook precmd theme_precmd