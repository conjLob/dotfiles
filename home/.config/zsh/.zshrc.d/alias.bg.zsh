alias ls='lsd'
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -lA'

alias grep='grep --color=auto'
alias diff='diff -u --color=auto'
alias ip='ip -color=auto'

alias bathelp='bat --plain --language=help'
help() {
    "$@" --help 2>&1 | bathelp
}

alias task='go-task'

alias drill='drill -z'
