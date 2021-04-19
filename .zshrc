export EDITOR="vim"
export NVM_DIR="$HOME/.nvm"
export ZSH="/home/thomas/.oh-my-zsh"

# ZSH THEME AND PLUGINS
ZSH_THEME="powerlevel10k/powerlevel10k"
[ -f $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh
[ -f ${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh ] && source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
plugins=(git z fzf)
autoload -U colors && colors
TERM=xterm-256color

# ALIASES
[ -f ~/git/dotfiles/aliases/aliasrc ] && source ~/git/dotfiles/.aliasrc

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# NVM
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"




