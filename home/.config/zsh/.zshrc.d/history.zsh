setopt share_history
setopt extended_history
setopt hist_reduce_blanks
setopt hist_ignore_space
setopt hist_ignore_dups
setopt hist_expire_dups_first
setopt hist_find_no_dups

HISTSIZE=100000
SAVEHIST=10000
HISTFILE="$XDG_STATE_HOME/zsh/history"

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey -M emacs '^P' up-line-or-beginning-search
bindkey -M emacs '^N' down-line-or-beginning-search
