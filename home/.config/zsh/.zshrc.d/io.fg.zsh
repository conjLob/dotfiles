setopt interactive_comments

[ -t 0 ] && stty -ixon

bindkey -e
bindkey -M emacs '^Q' push-line-or-edit
