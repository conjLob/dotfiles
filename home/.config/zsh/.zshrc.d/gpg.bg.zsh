export GPG_TTY="$(tty)"
export GPG_SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"

gpg-connect-agent updatestartuptty /bye >/dev/null
