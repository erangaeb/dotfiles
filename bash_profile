# git auto completeion
#source ~/.git-completion.bash
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

export CLICOLOR=1

# show current directory in bash prompt
# show git branch name in bash prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
#export PS1="\u@\h \[\033[32m\]\w\$(parse_git_branch)\[\033[00m\] $ "
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

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

# fix django locale issue from here on mac
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# swift run on command line
alias swift=/Applications/Xcode6-Beta2.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift

# enable/venv
alias venv="source /Users/eranga/Public/installations/venv/bin/activate"

# django auto complete
. $HOME/.django_bash_completion
