export EDITOR="nvim"
export VISUAL="nvim"

# Aliases
alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias grep='grep --color=auto'
alias ec='$EDITOR $HOME/.zshrc' # edit .zshrc
alias sc='source $HOME/.zshrc'  # reload zsh configuration
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -vI'
alias mkdir='mkdir -pv'
alias history='fc -l 1'

# Use vi keybindings even if our EDITOR is set to vi
bindkey -e

setopt HIST_IGNORE_ALL_DUPS  # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS  # do not save duplicated command
setopt HIST_REDUCE_BLANKS  # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt EXTENDED_HISTORY  # record command start time

# Keep 500000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=50000000
SAVEHIST=${HISTSIZE}
HISTFILESIZE=500000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

# Set colours
autoload -U colors && colors

PS1="%B%{$fg[red]%}[%{$fg[red]%}%n%{$fg[green]%}@%{$fg[red]%}%M %{$fg[green]%}%~%{$fg[red]%}]%{$reset_color%}#%b "

# zplug - manage plugins
source /usr/share/zplug/init.zsh
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"

# zplug - install/load new plugins when zsh is started or reloaded
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load
