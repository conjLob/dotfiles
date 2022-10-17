alias ls='lsd'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

alias grep='grep --color=auto'
alias diff='diff -u --color=auto'
alias ip='ip -color=auto'

alias bathelp='bat --plain --language=help'
help() {
    "$@" --help 2>&1 | bathelp
}

alias drill='drill -z'
