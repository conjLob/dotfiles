PATH="$HOME/.local/bin:$PATH"

export PAGER=less
export EDITOR=vim
export VISUAL=vim
export BROWSER='/mnt/c/Program Files/Google/Chrome/Application/chrome.exe'

# man
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# qt
export QT_QPA_PLATFORM='wayland;xcb'

# gpg
export GPG_TTY="$(tty)"
export GPG_SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
gpg-connect-agent -q /bye

# direnv
export DIRENV_LOG_FORMAT=''

# kubectl krew
PATH="$HOME/.krew/bin:$PATH"

# rust
PATH="$HOME/.cargo/bin:$PATH"

# go
export GOPATH="$HOME/.go"
PATH="$GOPATH/bin:$PATH"

export PATH
