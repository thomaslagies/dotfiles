export EDITOR="nvim"
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git --ignore node_modules -g ""'
export NVM_DIR="$HOME/.nvm"
export ZSH="$HOME/.oh-my-zsh"

[ -f ~/git/dotfiles/aliases/aliasrc ] && source ~/git/dotfiles/.aliasrc

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

TERM=xterm-256color
plugins=(git z fzf)
autoload -U colors && colors
