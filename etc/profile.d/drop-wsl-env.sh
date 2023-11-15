# Drop unnecessary paths added by WSL
export PATH="$(echo $PATH | sed 's|:/usr/sbin||; s|:/sbin:/bin:/usr/games:/usr/local/games||')"

# Unset WSL locale settings to respect /etc/locale.conf
unset LANG
