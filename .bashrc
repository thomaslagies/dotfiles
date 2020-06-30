# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export I3SCRIPTS=/usr/lib/i3blocks
export PATH=$HOME/.gem/ruby/2.7.0/bin:${PATH}
export RUBYOPT="-W0"
export EDITOR="vim"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

PROMPT_COMMAND=__prompt_command # Func to gen PS1 after CMDs

__prompt_command() {
    local EXIT="$?"             # This needs to be first
    PS1=""

    local RemoveColor='\[\e[0m\]'
    # Normal
    local Red='\[\e[0;31m\]'
    local Yellow='\[\e[0;33m\]'
    local Purple='\[\e[0;35m\]'
    local Cyan='\[\e[0;36m\]'
    local Blue='\[\e[0;34m\]'
    local Orange='\[\e[38;5;202m\]'
    # Bold
    local BoldGreen='\[\e[1;32m\]'
    local BoldBlue='\[\e[1;34m\]'

    PS1+=" ${Blue}\w"
    PS1+="${Orange} $(git_branch)$(git_branch_dirty)"
    PS1+="\n${Yellow} ↳ ${RemoveColor}"
}

git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

git_branch_dirty() {
  eval [[ -n "$(git status -s 2> /dev/null)" ]] && echo " ●"
}

git_branch_pull() {
  eval [[ -n "$(git status -uno | grep -o '[0-9]*' 2> /dev/null)" ]] && echo " ▽"
}

aliases=(.docker-aliases .shell-aliases .npm-aliases .git-aliases)
for i in "${aliases[@]}"
do
    if [ -f ~/git/dotfiles/$i ]; then
        . ~/git/dotfiles/$i
    fi
done
