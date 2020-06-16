# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=$HOME/.gem/ruby/2.7.0/bin:${PATH}
export RUBYOPT="-W0"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#export NPM_CONFIG_PREFIX=$HOME/.npmglobal

export I3SCRIPTS=/usr/lib/i3blocks

# DOCKER
alias doki='docker kill $(docker ps -q)'
alias dorm='docker rm $(docker ps -aq)'
alias dco='docker-compose'
alias dcou='docker-compose up -d'
alias dcod='docker-compose down'
alias dcoinfu='pushd ~/git/docker/infrastructure; dcu; popd'
alias dcoinfd='pushd ~/git/docker/infrastructure; dcd; popd'

#NPM
alias nr='npm run'

#GIT
alias yolo='git add . && git commit -m "`curl -s https://krautipsum.com/api/noun | fx .noun` `curl -s https://krautipsum.com/api/noun | fx .noun`" && git push'
#INCLUDE ZSH ALIASES
if [ -f $HOME/git/ohmyzsh/plugins/git/git.plugin.zsh ]; then
    . $HOME/git/ohmyzsh/plugins/git/git.plugin.zsh
fi

# Add git branch if its present to PS1

parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
if [ "$color_prompt" = yes ]; then
 PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '
else
 PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)\$ '
fi

unset color_prompt force_color_prompt

#SH
alias c='clear'
alias ll='ls -la'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac