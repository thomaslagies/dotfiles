export DOCKER_HOST=unix:///$HOME/.colima/docker.sock
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

HISTFILE="$HOME/.zsh_history"
HISTSIZE=500000
SAVEHIST=500000
setopt BANG_HIST                 
setopt EXTENDED_HISTORY         
setopt INC_APPEND_HISTORY      
setopt SHARE_HISTORY          
setopt HIST_EXPIRE_DUPS_FIRST 
setopt HIST_IGNORE_DUPS      
setopt HIST_IGNORE_ALL_DUPS 
setopt HIST_FIND_NO_DUPS   
setopt HIST_IGNORE_SPACE  
setopt HIST_SAVE_NO_DUPS 
setopt HIST_VERIFY      

FZF_VERSION=$(fzf --version | cut -d' ' -f1)
source /opt/homebrew/Cellar/fzf/$FZF_VERSION/shell/key-bindings.zsh

[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
[ -f $HOME/git/dotfiles/.aliasrc ] && source $HOME/git/dotfiles/.aliasrc

eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
