export ZSH="/home/tol/.oh-my-zsh"
export I3SCRIPTS=/usr/lib/i3blocks
export PATH=$HOME/.gem/ruby/2.7.0/bin:${PATH}
export RUBYOPT="-W0"
export EDITOR="vim"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

ZSH_THEME="avit"
TERM=xterm-256color

plugins=(git z fzf)

[ -f $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/git/dotfiles/.docker-aliases ] && source ~/git/dotfiles/.docker-aliases
[ -f ~/git/dotfiles/.npm-aliases ] && source ~/git/dotfiles/.npm-aliases
[ -f ~/git/dotfiles/.shell-aliases ] && source ~/git/dotfiles/.shell-aliases
[ -f ~/git/dotfiles/.stuff-aliases ] && source ~/git/dotfiles/.stuff-aliases
