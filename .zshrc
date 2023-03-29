export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"

plugins=(git z fzf)

LS_COLORS=$LS_COLORS:'di=1,36' ; export LS_COLORS

[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag --hidden --ignore "^.git$" --ignore "^node_modules$" -g ""'

if [ -d "${HOME}/Library/Python" ]; then
  PYTHON_VERSION=$(ls -1 $HOME/Library/Python/ | sort -V | tail -n1)
  export PATH="${HOME}/Library/Python/${PYTHON_VERSION}/bin:${PATH}"
fi

source $ZSH/oh-my-zsh.sh
[ -f $HOME/git/dotfiles/.aliasrc ] && source $HOME/git/dotfiles/.aliasrc

source $HOME/.docker/init-zsh.sh || true # Added by Docker Desktop
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"

export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

eval "$(starship init zsh)"

