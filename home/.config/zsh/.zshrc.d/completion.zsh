setopt menu_complete
setopt list_packed
setopt glob_dots
setopt numeric_glob_sort
setopt magic_equal_subst
setopt complete_in_word
unsetopt auto_remove_slash

[ ! -d "$XDG_CACHE_HOME/zsh" ] && mkdir -p "$XDG_CACHE_HOME/zsh"

zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"
zstyle ':completion:*' menu select interactive
zstyle ':completion:*' completer _complete _prefix
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' '+r:|[-_.]=**'
zstyle ':completion:*' list-colors "$LS_COLORS"

autoload -Uz compinit
zsh-defer compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"

zmodload zsh/complist
bindkey -M menuselect '^P' up-line-or-history
bindkey -M menuselect '^N' down-line-or-history
