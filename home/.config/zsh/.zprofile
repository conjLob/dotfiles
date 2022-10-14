PATH="$HOME/.local/bin:$PATH"

# qt
export QT_QPA_PLATFORM='wayland;xcb'

# gpg
export GPG_TTY="$(tty)"
export GPG_SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
gpg-connect-agent -q /bye

# man
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# kubectl krew
PATH="$HOME/.krew/bin:$PATH"

# rust
PATH="$HOME/.cargo/bin:$PATH"

# go
export GOPATH="$HOME/.go"
PATH="$GOPATH/bin:$PATH"

export PATH
