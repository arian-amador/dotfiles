# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Run ssh agent only once
if ! pgrep -u "$USER" -f -x "^ssh-agent$" > /dev/null; then
    echo "starting ssh agent"
    ssh-agent > ~/.ssh-agent-thing
    eval "$(<~/.ssh-agent-thing)" /dev/null
fi
if [ -f ~/.ssh-agent-thing ]; then
    eval "$(<~/.ssh-agent-thing)" > /dev/null
fi

# Aliases
alias ls="ls --color"
alias l="ls -alh"
alias ll="ls -alh"
alias lls="ls -lh --color"
alias lsf="ls -al | grep -i"
alias psf="ps aux -A | grep -i"
alias psmem="ps aux --sort -rss"
alias grepp="grep -Rnsi"
alias ports='netstat -tulanp'

# Better manuals
man() {
    env \
    LESS_TERMCAP_mb=$'\e[01;31m' \
    LESS_TERMCAP_md=$'\e[01;38;5;74m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[46;30m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[04;38;5;146m' \
    man "$@"
}

# Exports
export EDITOR=vim
export SUDO_EDITOR=vim
export GIT_EDITOR=vim
export HISTCONTROL=ignoredups
export HISTSIZE=10000
export HISTFILESIZE=10000

# append to the history file, don't overwrite it
shopt -s histappend

# Prompt
if [ -f "$HOME/.prompt" ]; then
  . "$HOME/.prompt"
fi

# Path Helper
pathadd() {
    if [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="${PATH:+"$PATH:"}$1"
    fi
}
pathadd "/home/${USER}/bin/"
