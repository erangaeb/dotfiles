# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="senzshell"

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
plugins=(git)

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
export NDK_HOME=/Users/eranga/Public/installations/android-ndk
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

# set up boot2docker
export DOCKER_HOST=tcp://192.168.59.103:2375
unset DOCKER_TLS_VERIFY
unset DOCKER_CERT_PATH
#export DOCKER_CERT_PATH=/Users/eranga/.boot2docker/certs/boot2docker-vm
#export DOCKER_TLS_VERIFY=1

# jboss home
export JBOSS4_HOME=/Users/eranga/Public/installations/jboss
export PATH=$PATH:$JBOSS_HOME/bin

# start jboss, can start in 3 modes
# 1. normal mode    : start-jboss
# 2. job mode       : start-jboss job 
# 3. test mode      : start-jboss test
# jboss runs on localhost:8080
start-jboss() {
     echo "starting jboss..."
     cd $JBOSS4_HOME/bin
     if [ $# -ne 1 ]; then
          echo "running the jboss in normal mode..."
          sh $JBOSS4_HOME/bin/run.sh
     fi
     if [ "$1" = "job" ]; then
          echo "running the jboss with jobs..."
          sh $JBOSS4_HOME/bin/run.sh -DrunSingletonScheduler=true -Djava.ejbtest=true -b 0.0.0.0
     fi
     if [ $1 = "test" ]; then
      echo "Running jboss with test profile..."
          sh $JBOSS4_HOME/bin/run.sh -c st -DrunSingletonScheduler=true -Djava.ejbtest=true
     fi
}

# start postgres via boot2docker
start-postgres() {
    echo "starting postgres..."
    boot2docker up
    docker start postgres
    echo "postgres started"
}

# start rabbitmq server via docker
# server runs on localhost:15672
start-rabbitmq() {
    echo "starting rabbitmq..."
    boot2docker up
    docker start rabbitmq
    echo "rabbitmq started"
}

# deploy 
#   1. paysol-*.ear
#   2. paysol-*.jar
#   3. paysol-security-*.jar
deploy-paysol() {
    echo "cleaning default..."
    rm $JBOSS4_HOME/server/default/deploy/paysol-*.ear
    rm $JBOSS4_HOME/server/default/deploy/paysol-*.jar
    rm -rf $JBOSS4_HOME/server/default/work/*
    rm -rf $JBOSS4_HOME/server/default/tmp/*
    rm -rf $JBOSS4_HOME/server/default/deploy/tmp.develop/*
    echo "deploying to default..."
    cd ~/Workspace/pagero/pagero-online/paysol
    echo "copying files..."
    cp ./core/ear/target/paysol-*.ear $JBOSS4_HOME/server/default/deploy
    cp `find . -name 'paysol-security-*.jar' | grep ./core/ear/target/paysol-ear/lib/` $JBOSS4_HOME/server/default/deploy
}

# Set java opts to find whats going wrong with jrebel
export JAVA_OPTS="$JAVA_OPTS -Drebel.log=true"
