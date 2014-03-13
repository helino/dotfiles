hg_qq() {
    local q=$(hg qq --active 2>/dev/null)
    if [ -n "$q" ]; then
        echo -n " ($q)"
    fi
}

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# share history
shopt -s histappend
history -a

PS1="[\u@\h:\w\$(hg_qq)]\n> "

export PATH=$PATH:$HOME/bin:$HOME/work/bin

# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# aliases
alias tls='tmux ls'
alias g='grep --dereference-recursive --color=auto --line-number --binary-files=without-match'
alias ff='firefox'
alias fn='find . -name '
alias v='vim'
alias e='emacs --fullscreen'
