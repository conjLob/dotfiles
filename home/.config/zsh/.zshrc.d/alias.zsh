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

cmds=(
    id
    w
    who
    env
    stat
    last
    uptime
    sysctl
    ps
    free
    vmstat
    blkid
    lsblk
    mount
    findmnt
    ss
    lsof
    nmap
    ping
    whois
    traceroute
    docker
    docker-compose
)
for cmd in $cmds; do
    $cmd() {
        grc --colour=auto "$0" "$@"
    }
done
unset cmds cmd

alias drill='drill -z'
