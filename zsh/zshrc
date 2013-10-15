# KEYS
bindkey -v
bindkey -M viins 'jj' vi-cmd-mode
bindkey -M viins "^[[A" up-line-or-history
bindkey -M viins "^[[B" down-line-or-history
bindkey "^?" backward-delete-char
bindkey "^R" history-incremental-search-backward
bindkey -s '^O' 'cd ..\n'

# ALIAS
alias tmux='TERM=xterm-256color tmux'

# PROMPT
PROMPT="[%n %m %B%2c%b]
> "

# PATH
export PATH="$HOME/bin:$PATH"

# COMPLETION
autoload -U compinit
compinit
zstyle ':completion:*' menu select
setopt completealiases
setopt magic_equal_subst

# HISTORY
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt append_history inc_append_history no_share_history
