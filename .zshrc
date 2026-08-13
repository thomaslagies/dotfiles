autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi
export DOCKER_DEFAULT_PLATFORM=linux/amd64
export EDITOR="nvim"
export FZF_DEFAULT_COMMAND='ag --hidden --ignore "^.git$" --ignore "^node_modules$" -g ""'
export HOMEBREW_CASK_OPTS="--appdir=${HOME}/Applications"
export LANGUAGE=en_US:en
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export XDG_CONFIG_HOME="${HOME}/.config"
if [ -d "${HOME}/Library/Python" ]; then
  PYTHON_VERSION=$(ls -1 $HOME/Library/Python/ | sort -V | tail -n1)
  export PATH="${HOME}/Library/Python/${PYTHON_VERSION}/bin:${PATH}"
fi

bindkey '^[[1;3D' backward-word
bindkey '^[[1;3C' forward-word

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

export NVM_DIR="$HOME/.nvm"
_load_nvm() {
  unset -f nvm node npm npx
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}
nvm()  { _load_nvm; nvm "$@"; }
node() { _load_nvm; node "$@"; }
npm()  { _load_nvm; npm "$@"; }
npx()  { _load_nvm; npx "$@"; }

[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
[ -f $HOME/git/dotfiles/.aliasrc ] && source $HOME/git/dotfiles/.aliasrc

eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# ponytail: cached, kubectl completion generation is slow (~40ms) and static per kubectl version; `rm ~/.zsh_kubectl_completion` to regenerate after upgrading kubectl
[[ -s ~/.zsh_kubectl_completion ]] || kubectl completion zsh > ~/.zsh_kubectl_completion
source ~/.zsh_kubectl_completion

# Created by `pipx` on 2025-09-11 13:26:54
export PATH="$PATH:/Users/thomas.lagies/.local/bin"
