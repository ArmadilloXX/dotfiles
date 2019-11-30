# Returns whether the given command is executable or aliased.
_has() {
  return $( whence $1 >/dev/null )
}
# Turn on Antigen
source /usr/local/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load theme
# antigen theme denysdovhan/spaceship-prompt

# Tell Antigen that you're done.
antigen apply

# Path to your oh-my-zsh installation.
export ZSH=/Users/ilya/.oh-my-zsh

# fzf via Homebrew
if [ -e /usr/local/opt/fzf/shell/completion.zsh ]; then
  source /usr/local/opt/fzf/shell/key-bindings.zsh
  source /usr/local/opt/fzf/shell/completion.zsh
fi

# fzf + ag configuration
if _has fzf && _has ag; then
  export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_DEFAULT_OPTS="--color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108 --color info:108,prompt:109,spinner:108,pointer:168,marker:168"
fi

_not_inside_tmux() { [[ -z "$TMUX" ]] }

ensure_tmux_is_running() {
  if _not_inside_tmux; then
    tat
  fi
}

ensure_tmux_is_running

bindkey -e

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="spaceship"

# Spaceship theme configuration
# SPACESHIP_PACKAGE_SHOW=false
# SPACESHIP_BATTERY_SHOW=false
# SPACESHIP_BATTERY_SHOW=always
# SPACESHIP_VI_MODE_SHOW=false

ZSH_THEME="robbyrussell"
# ZSH_THEME="excess"
# ZSH_THEME="miloshadzic"
# ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode jsontools docker)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias current='cd ~/Coding/RoR/mkdev/flashcards-chef-repo/'
alias be='bundle exec'
alias bi='bundle install'
alias dmlocal='eval "$(docker-machine env -u)"'
alias celar='clear'
alias dcm='docker-compose'
alias pg='psql -h localhost -U postgres'
alias k='kubectl'
alias mk='minikube'

# Fix Vagrant issue when ulimit is too small
ulimit -n 4096

# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

# ChefDK configuration
# export PATH=$HOME/.chefdk/gem/ruby/2.1.0/bin:/opt/chefdk/bin:$PATH
export PATH="/opt/chefdk/embedded/bin:$PATH"

# Rbenv configuration
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

dmconnect() {
  eval $(docker-machine env $1)
}

dash() {
	open dash://$1
}

showmod() {
  stat -f "%N: %Mp%Lp" $1
}

# Jenv configuration
export JENV_ROOT=/usr/local/var/jenv
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# Nodenv configuration
export NODENV_ROOT=/usr/local/var/nodenv
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# export HOMEBREW_GITHUB_API_TOKEN=$(security find-generic-password -s 'Homebrew GH Token' -w)
# export HABITAT_AUTH_TOKEN=$(security find-generic-password -s 'Habitat Auth Token' -w)
# export EDITOR="vim"
# export GEM_EDITOR="vim"
# export GIT_EDITOR="vim"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#Go configuration
# export GOENV_ROOT="$HOME/.goenv"
# export PATH="$GOENV_ROOT/bin:$PATH"
# export HOMEBREW_GITHUB_API_TOKEN=$(security find-generic-password -s 'Homebrew GH Token' -w)
# export HABITAT_AUTH_TOKEN=$(security find-generic-password -s 'Habitat Auth Token' -w)
export EDITOR="nvim"
export GEM_EDITOR="nvim"
export GIT_EDITOR="nvim"

# Goenv configuration
export PATH="$HOME/Go/bin:/usr/local/go/bin:$PATH"
export GOPATH=$HOME/Go
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"

#Rust configuration
export PATH="$HOME/.cargo/bin:$PATH"

# source "/Users/ilya/.oh-my-zsh/custom/themes/spaceship.zsh-theme"

# Set Spaceship ZSH as a prompt
# autoload -U promptinit; promptinit
# prompt spaceship

# Set StanfordCoreNLP env variables
# export STANFORD_JAR_PATH="/Users/ilya/Coding/Projects/stanford-bin/"
# export STANFORD_MODEL_PATH="/Users/ilya/Coding/Projects/stanford-bin/"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export LC_ALL=en_US.UTF-8
export PATH=$HOME/bin:$PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ilya/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ilya/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ilya/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ilya/google-cloud-sdk/completion.zsh.inc'; fi
# source "/Users/ilya/.oh-my-zsh/custom/themes/spaceship.zsh-theme"
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH=$HOME/bin:$PATH
test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"
export PATH=$HOME/.kerl/builds/21.0/release_21.0/bin:$PATH
[[ -s "$HOME/.kiex/scripts/kiex" ]] && source "$HOME/.kiex/scripts/kiex"
