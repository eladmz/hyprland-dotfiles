export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE

# History
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY
# End History

source ~/.zsh_extra 2> /dev/null

source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-execute
bindkey '^l' autosuggest-accept
bindkey '^I' expand-or-complete
bindkey '^w' vi-forward-word
bindkey '^b' vi-backward-word
bindkey '^k' up-line-or-search
bindkey '^j' down-line-or-search
bindkey '^[[H' beginning-of-line # fix home key
bindkey '^[[F' end-of-line # fix end key
bindkey '^[[3~' delete-char # fix delete key

# fzf config

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

source ~/.config/fzf/fzf-git.sh

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

source <(fzf --zsh)

# end fzf config

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

alias k="kubectl"
alias kctx="kubectl config use-context"

alias ls="eza --icons=always"
alias l="eza -l --icons --git -a"
alias ll="eza -l --icons --git -a"
alias lt="eza --tree --level=2 --long --icons --git"

alias cl="clear"
alias cd="z"
alias cdi="zi"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

alias lg="lazygit"
alias gs="git status"
alias gd="git diff"
alias gdt="git difftool"

alias mk="minikube"

source ~/.config/zsh/zsh-syntax-highlighting-catppuccin/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
