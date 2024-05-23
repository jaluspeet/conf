export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="simple"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# variables
export VISUAL='nvim'
export EDITOR='nvim'

# alias
alias vim='nvim'
alias vimdiff='nvimdiff'
alias lss='ls -lah'

# functions / keybondings
function Resume { fg; zle push-input; BUFFER=""; zle accept-line } 
zle -N Resume; bindkey "^Z" Resume
