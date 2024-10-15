# Zsh

# starship
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# zxoide
eval "$(zoxide init zsh)"

# fzf integrations
fcd() {
  local dir
  dir=$(find . -type d 2> /dev/null | fzf +m) && cd "$dir"
}

# Set vertical I-beam cursor
echo -ne "\e[5 q"

# homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
export HOMEBREW_NO_ANALYTICS=1

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
setopt share_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups
setopt hist_ignore_dups
setopt hist_expire_dups_first
setopt hist_verify

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle :compinstall filename '/home/eyes/.zshrc'
zstyle ':completion:*' menu no

autoload -Uz compinit
compinit

# zsh-autocomplete
source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

function nvims() {
  items=$(find $HOME/.config -maxdepth 2 -name "init.lua" -type f -execdir sh -c 'pwd | xargs basename' \;)
  selected=$(printf "%s\n" "${items[@]}" | \
    FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS-} --prompt='   Neovim Configs' --preview-window 'right:border-left:50%:<40(right:border-left:50%:hidden)' --preview 'lsd -l -A --tree --depth=1 --color=always --blocks=size,name ~/.config/{} | head -200'" \
    fzf)

  if [[ -z $selected ]]; then
    return 0
  elif [[ $selected == "nvim" ]]; then
    selected=""
  fi
  NVIM_APPNAME=$selected nvim "$@"
}
alias nvs=nvims

# aliasis
alias la='ls -a'
alias l='ls -CF'
alias ll='ls -l'
alias ls='ls --color'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias bat='batcat'
alias vim='nvims'
alias see='fzf --preview="bat --color=always {}"'
alias change='code $(fzf --preview="bat --color=always {}")'
alias tmux='tmux -f ~/.tmux.conf'

# Color support
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias rain='cmatrix'

fastfetch

