# Lines configured by zsh-newuser-install
HISTFILE=~/.history
HISTSIZE=1000
SAVEHIST=10000
bindkey -v
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey "^R" history-incremental-search-backward
bindkey '^U' kill-whole-line
bindkey '^D' delete-char-or-list
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/anemitz/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export EDITOR=vim

alias d='dirs -v'
export LSCOLORS=ExFxCxDxBxegedabagacad
alias ls='ls -G'
alias l='ls -G'
alias mv='mv -i'
alias load='while :; do echo > /dev/null; done'
autoload -U promptinit
promptinit
setopt autocd autopushd pushdignoredups hist_verify correct

# completion
zstyle ':completion' completer _complete _match _approximate
zstyle ':completion:*:match' original only
zstyle ':completion:*:approximate' max-errors 1 numeric

zstyle ':completion:*:*:kill' menu yes select
zstyle ':completion:*:kill' force-list always

zstyle ':completion:*:cd' ignore-parents parent pwd

#possible fix for slowness on git add
#__git_files(){ _wanted files expl 'local files' _files }

# colors
blue_color=$'%{\e[01;34m%}'
green_color=$'%{\e[01;32m%}'
lightblue_color=$'%{\e[01;36m%}'
darkblue_color=$'%{\e[00;36m%}'
yellow_color=$'%{\e[01;33m%}'
lightred_color=$'%{\e[01;31m%}'
darkred_color=$'%{\e[00;31m%}'
reset_color=$'%{\e[0m%}'
PS1="${green_color}%* ${darkblue_color}%n${lightblue_color}@\
${darkblue_color}%m${lightred_color}%(?.. %?) \
${yellow_color}%c${blue_color} %# ${reset_color}"

# MacPorts Installer addition on 2010-10-19_at_14:03:17: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

export CFLAGS="-I/opt/local/include -L/opt/local/lib"

export PYTHONPATH=.:./lib:$PYTHONPATH
