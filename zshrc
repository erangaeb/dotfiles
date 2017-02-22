# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="dockerps"
ZSH_THEME="senzagnoster"
#ZSH_THEME="the_poncho"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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
plugins=(battery git docker)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

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
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# set java home
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# set up andoird home
# android installed into ~/Public/installations
export ANDROID_HOME=/Users/eranga/Public/installations/android-sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

# set up andoird NDK
#export NDK_HOME=/Users/eranga/Public/installations/android-ndk
export NDK_ROOT=/Users/eranga/Public/installations/android-ndk-r13b
export NDK_HOME=/Users/eranga/Public/installations/android-ndk-r13b
export PATH=$PATH:$NDK_HOME

# setup gradle home
export GRADLE_HOME=/Users/eranga/Public/installations/gradle
export PATH=$PATH:$GRADLE_HOME/bin

# set up RabbitMQ server scripts
export PATH=$PATH:/usr/local/sbin

# fix django locale issue from here on mac
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# swift run on command line
alias swift="/Applications/Xcode6-Beta2.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift"

# enable/venv
alias venv="source /Users/eranga/Public/installations/venv/bin/activate"

# django auto complete
# . $HOME/.django_bash_completion

# set up maven home 
#export M2_HOME=/usr/local/Cellar/maven/3.2.3/libexec

# Colorize maven
alias maven="/usr/local/bin/mvn"
alias mvn="colorize_maven"

colorize_maven() {
  local BOLD=`tput bold`
  local TEXT_RED=`tput setaf 1`
  local TEXT_GREEN=`tput setaf 2`
  local TEXT_YELLOW=`tput setaf 3`
  local RESET_FORMATTING=`tput sgr0`

  maven $@ | sed -e "s/\(\[INFO\]\ \-\-\-\ .*\)/${TEXT_BLUE}\1${RESET_FORMATTING}/g" \
    -e "s/\(\[INFO\]\ \[.*\)/${RESET_FORMATTING}\1${RESET_FORMATTING}/g" \
    -e "s/\(\[INFO\]\ \)\(BUILD SUCCESS\)/\1${TEXT_GREEN}\2${RESET_FORMATTING}/g" \
    -e "s/\(\[INFO\]\ \)\(BUILD FAILURE\)/\1${TEXT_RED}\2${RESET_FORMATTING}/g" \
    -e "s/\(\[WARNING\].*\)/${TEXT_YELLOW}\1${RESET_FORMATTING}/g" \
    -e "s/\(\[ERROR\]\)/${TEXT_RED}\1${RESET_FORMATTING}/g" \
    -e "s/\(Failed tests: \)/${TEXT_RED}\1${RESET_FORMATTING}/g" \
    -e "s/\(Exception in thread \".*\" \)\(.*\)/\1${TEXT_RED}\2${RESET_FORMATTING}/g" \
    -e "s/\(SUCCESS \)\[/${RESET_FORMATTING}${TEXT_GREEN}\1${RESET_FORMATTING}\[/g" \
    -e "s/\(FAILURE \)\[/${RESET_FORMATTING}${TEXT_RED}\1${RESET_FORMATTING}\[/g" \
    -e "s/\(Caused by: \)\([^:\t ]*\)/\1${TEXT_RED}\2${RESET_FORMATTING}/g" \
    -e "s/\(ERROR\ \[.*\)/${TEXT_RED}\1${RESET_FORMATTING}/g" \
    -e "s/Tests run: \([^,]*\), Failures: \([^,0]*\), Errors: \([^,]*\), Skipped: \([^,]*\)/${TEXT_GREEN}Tests run: \1${RESET_FORMATTING}, Failures: ${TEXT_RED}\2${RESET_FORMATTING}, Errors: ${TEXT_RED}\3${RESET_FORMATTING}, Skipped: ${TEXT_YELLOW}\4${RESET_FORMATTING}/g"

  echo -ne ${RESET_FORMATTING}
}

# set up boot2docker
export DOCKER_HOST=tcp://192.168.59.103:2375
unset DOCKER_TLS_VERIFY
unset DOCKER_CERT_PATH
#export DOCKER_CERT_PATH=/Users/eranga/.boot2docker/certs/boot2docker-vm
#export DOCKER_TLS_VERIFY=1

# Set java opts to find whats going wrong with jrebel
export JAVA_OPTS="$JAVA_OPTS -Drebel.log=true"

# github token for homebrew
export HOMEBREW_GITHUB_API_TOKEN=066e3efadd9ff53f84a85957def2d7ef1c85c698

# cheat 
export CHEATCOLORS=true
export EDITOR=vim 
