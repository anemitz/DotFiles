# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="sunrise"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

#PATH=~/.pyenv/shims:/Applications/Postgres.app/Contents/Versions/9.3/bin:/usr/local/opt/openssl/bin:/usr/local/opt/curl/bin:/usr/local/opt/ccache/libexec:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:~/bin
#PATH=/Applications/Postgres.app/Contents/Versions/9.3/bin:/usr/local/opt/openssl/bin:/usr/local/opt/curl/bin:/usr/local/opt/ccache/libexec:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:~/bin
PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:~/bin

#ZSH Completions
fpath=(/usr/local/share/zsh-completions $fpath)

export PYENV_ROOT=/usr/local/opt/pyenv
if which pyenv > /dev/null; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

#export VIRTUALENVWRAPPER_PYTHON="$(pyenv which python 2>/dev/null || true)"; 
#export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
#source /usr/local/bin/virtualenvwrapper.sh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-extras osx autoenv)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#WORKON_HOME=$HOME/.virtualenvs
export EDITOR=vim
export GEM_HOME=$(brew --prefix)
export PYTHONPATH=$PYTHONPATH:./lib
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias rsync="rsync --exclude-from=$HOME/.rsync/exclude"

# fuck the fancy shit, i just want a fast prompt
function custom_git_prompt() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}"
}

show_virtual_env() {
  if [ -n "$VIRTUAL_ENV" ]; then
    echo "($(basename $VIRTUAL_ENV))"
  fi
}

PS1='$(show_virtual_env)'$PS1

eval "$(direnv hook zsh)"

gpip() {
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

