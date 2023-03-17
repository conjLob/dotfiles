# Drop unnecessary paths added by WSL
export PATH="$(echo $PATH | sed 's|:/usr/sbin||; s|:/sbin:/bin:/usr/games:/usr/local/games||')"
