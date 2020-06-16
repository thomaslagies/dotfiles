# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export I3SCRIPTS=/usr/lib/i3blocks
export PATH=$HOME/.gem/ruby/2.7.0/bin:${PATH}
export RUBYOPT="-W0"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
