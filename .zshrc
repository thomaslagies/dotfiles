export ZSH="/home/$USER/.oh-my-zsh"
export I3SCRIPTS=/usr/lib/i3blocks
export PATH=$HOME/.gem/ruby/2.7.0/bin:${PATH}
export RUBYOPT="-W0"
export EDITOR="vim"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

ZSH_THEME="avit"

autoload -U colors && colors
TERM=xterm-256color

# keyboard delay and rate
xset r rate 350 40

plugins=(git z fzf)

[ -f $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/git/dotfiles/aliases/aliasrc ] && source ~/git/dotfiles/aliases/aliasrc

PATH="/home/tol/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/tol/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/tol/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/tol/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/tol/perl5"; export PERL_MM_OPT;
