alias ls='lsd --date="+%F %T %a"'
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

alias path='echo $PATH | tr ":" "\n"'

alias vi='nvim'
alias task='go-task'
alias k9r='k9s --readonly'

alias drill='drill -z'
