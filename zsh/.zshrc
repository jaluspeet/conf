export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="simple"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# variables
export VISUAL='nvim'
export EDITOR='nvim'
export FZF_DEFAULT_OPTS='--color=bg+:235,spinner:39,hl:41,header:243,info:44,pointer:39,marker:39,prompt:39,hl+:39'

# alias
alias vim='nvim'
alias lss='ls -lah'
alias gtt='lazygit'
alias cdd='cd $(fd --type directory | fzf)'

# functions / keybindings
function Resume { fg; zle push-input; BUFFER=""; zle accept-line } 
zle -N Resume; bindkey "^Z" Resume
