_fzf_compgen_path() {
    fd --follow --hidden --exclude=.git . "$1"
}

_fzf_compgen_dir() {
    fd --follow --hidden --exclude=.git --type=directory . "$1"
}

_fzf_comprun() {
    local cmd=$1
    shift

    case "$cmd" in
    export | unset)
        fzf --preview "eval 'echo \${}'" "$@"
        ;;
    unalias | kill | ssh)
        fzf "$@"
        ;;
    *)
        fzf --preview 'preview_path {}' "$@"
        ;;
    esac
}

export FZF_DEFAULT_COMMAND='fd --follow --hidden --exclude=.git --type=file'
export FZF_CTRL_T_COMMAND='fd --follow --hidden --exclude=.git'
export FZF_ALT_C_COMMAND='fd --follow --hidden --exclude=.git --type=directory'

export FZF_CTRL_T_OPTS="--preview 'preview_path {}'"
export FZF_ALT_C_OPTS="--preview 'preview_path {}'"

zstyle ':fzf-tab:complete:*:options' fzf-preview

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'preview_path $realpath'
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'

zstyle ':completion:complete:git-*:*' sort false
zstyle ':completion:complete:git-*:*:options' sort true
zstyle ':fzf-tab:complete:git-(show|checkout|revert|reset|rebase|cherry-pick):*' fzf-preview 'git show --color=always --compact-summary $word'
zstyle ':fzf-tab:complete:git-(log|switch|branch|diff|merge):*' fzf-preview 'git log --color=always --oneline --no-decorate -n 30 $word'

bindkey -M emacs '^I' expand-or-complete
bindkey -M emacs '^[i' fzf-tab-complete
bindkey -M menuselect -s '^[i' '^G^[i'
