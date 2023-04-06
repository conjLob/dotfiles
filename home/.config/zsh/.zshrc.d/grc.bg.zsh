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
