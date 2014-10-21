hg_book() {
    local b=$(hg bookmark 2>/dev/null | grep -v "no bookmarks set")
    if [ -n "$b" ]; then
        local current=$(echo "$b" | grep \* | cut -d ' ' -f 3)
        echo -n " ($current)"
    fi
}

grepless() {
    grep --dereference-recursive        \
         --color=always                 \
         --line-number                  \
         --binary-files=without-match   \
         "$@" | less -FRX
}


# ulimited history
HISTSIZE=-1
HISTFILESIZE=-1

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# share history
shopt -s histappend
history -a

PS1="[\u@\h:\w\$(hg_book)]\n> "

export PATH=$HOME/bin:$HOME/bin/jdk1.8.0_05/bin:$HOME/work/bin:$PATH

# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# aliases
alias g='grepless'
alias ff='firefox'
alias fn='find . -name '

# Completion for the 'hg qc' alias
_hg_cmd_qc() {
    COMPREPLY=( $( compgen -W "$(_hg_cmd qqueue --quiet)" "${cur}" ) )
}
