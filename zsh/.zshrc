export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="simple"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# variables
export VISUAL='nvim'
export EDITOR='nvim'

# path
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.cargo/bin

# alias
alias vim='nvim'
alias vimdiff='nvimdiff'
alias lss='ls -lah'

# functions / keybondings
function Resume { fg; zle push-input; BUFFER=""; zle accept-line } 
zle -N Resume; bindkey "^Z" Resume
