export DOCKER_HOST=unix:///~/.colima/docker.sock
export EDITOR="nvim"
export FZF_DEFAULT_COMMAND='ag --hidden --ignore "^.git$" --ignore "^node_modules$" -g ""'
export NVM_DIR="$HOME/.nvm"
export NVM_LAZY_LOAD=true
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
if [ -d "${HOME}/Library/Python" ]; then
  PYTHON_VERSION=$(ls -1 $HOME/Library/Python/ | sort -V | tail -n1)
  export PATH="${HOME}/Library/Python/${PYTHON_VERSION}/bin:${PATH}"
fi

HISTFILE=~/.zsh_history
HISTSIZE=500000
SAVEHIST=500000
setopt appendhistory
setopt INC_APPEND_HISTORY  
setopt SHARE_HISTORY

source /opt/homebrew/Cellar/fzf/0.46.1/shell/key-bindings.zsh

[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
[ -f $HOME/git/dotfiles/.aliasrc ] && source $HOME/git/dotfiles/.aliasrc

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
