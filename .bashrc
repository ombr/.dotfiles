# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTFILESIZE=50000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
#if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
#    debian_chroot=$(cat /etc/debian_chroot)
#fi

# set a fancy prompt (non-color, unless we know we "want" color)
#case "$TERM" in
#    xterm-color) color_prompt=yes;;
#esac

color_prompt=yes

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

#if [ -n "$force_color_prompt" ]; then
#    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
#	color_prompt=yes
#    else
#	color_prompt=
#    fi
#fi
#Super hack !!
color_prompt=yes

#if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
#unset color_prompt force_color_prompt


# Bash completion
if [ -f /etc/bash_completion ]; then
. /etc/bash_completion
fi


export GIT_PS1_SHOWDIRTYSTATE=1

bash_prompt() {
    case $TERM in
     xterm*|rxvt*)
         local TITLEBAR='\[\033]0;\u:${NEW_PWD}\007\]'
          ;;
     *)
         local TITLEBAR=""
          ;;
    esac
    local NONE="\[\033[0m\]"    # unsets color to term's fg color
    
    # regular colors
    local K="\[\033[0;30m\]"    # black
    local R="\[\033[0;32m\]"    # red
    local G="\[\033[0;32m\]"    # green
    local Y="\[\033[0;33m\]"    # yellow
    local B="\[\033[0;34m\]"    # blue
    local M="\[\033[0;35m\]"    # magenta
    local C="\[\033[0;36m\]"    # cyan
    local W="\[\033[0;37m\]"    # white
    
    # emphasized (bolded) colors
    local EMK="\[\033[1;30m\]"
    local EMR="\[\033[1;32m\]"
    local EMG="\[\033[1;32m\]"
    local EMY="\[\033[1;33m\]"
    local EMB="\[\033[1;34m\]"
    local EMM="\[\033[1;35m\]"
    local EMC="\[\033[1;36m\]"
    local EMW="\[\033[1;37m\]"
    
    # background colors
    local BGK="\[\033[40m\]"
    local BGR="\[\033[41m\]"
    local BGG="\[\033[42m\]"
    local BGY="\[\033[43m\]"
    local BGB="\[\033[44m\]"
    local BGM="\[\033[45m\]"
    local BGC="\[\033[46m\]"
    local BGW="\[\033[47m\]"
    
    local UC=$W                 # user's color
    [ $UID -eq "0" ] && UC=$R   # root's color
    
    PS1="$TITLEBAR ${EMK}[${UC}\u${EMK}@${UC}\h ${EMB}\${NEW_PWD}${EMK}]${UC}\\$ ${NONE}"
    WHEREAMI="$LOGNAME@$HOSTNAME"
    if [ "$WHEREAMI" = "ombr@ombr" ]; then
        WHEREAMI=""
    fi;

    # without colors: PS1="[\u@\h \${NEW_PWD}]\\$ "
    # extra backslash in front of \$ to make bash colorize the prompt
}

bash_prompt_command() {
    # How many characters of the $PWD should be kept
    local pwdmaxlen=23
    # Indicate that there has been dir truncation
    local trunc_symbol=".."
    local dir=${PWD##*/}
    pwdmaxlen=$(( ( pwdmaxlen < ${#dir} ) ? ${#dir} : pwdmaxlen ))
    NEW_PWD=${PWD/#$HOME/\~}
    local pwdoffset=$(( ${#NEW_PWD} - pwdmaxlen ))
    if [ ${pwdoffset} -gt "0" ]
    then
        NEW_PWD=${NEW_PWD:$pwdoffset:$pwdmaxlen}
        NEW_PWD=${trunc_symbol}/${NEW_PWD#*/}
    fi
}
PROMPT_COMMAND=bash_prompt_command
bash_prompt


unset bash_prompt
#PS1='\e[1;32;47m\u \e[1;32;47mon \h \e[1;35;47m\d \@\e[0;0m\n\e[1;32m[dir.= \w] \# > \e[0;0m'
if [ $UID -ne 0 ]; then
        PS1='\[\033[01;32m\]${WHEREAMI}\[\033[00m\]:\[\033[01;34m\]${NEW_PWD}\[\033[00m\]'
else
        PS1='\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;31m\]${NEW_PWD}\[\033[00m\]'
fi
#git branch in bashrc :-D
PS1=$PS1'\[\033[01;33m\]$(__git_ps1 "(%s)")\[\033[01;00m\]\$ '
# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac






# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
    eval "`dircolors -b`"
    alias ls='ls -h --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'

function nd(){
	mkdir -p $1;
	cd $1;
}
# some more ls aliases
alias ll='ls -l'
alias la='ll -a'
alias cp='cp -v'
alias rm='rm -v'
alias .='echo $PWD'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias up='svn up'
alias ci='svn ci'
alias mombr='ssh ombr@m.ombr.fr'
#partage="/home/skippy/partage/"
alias Xresources="vim ~/.Xresources && xrdb -merge ~/.Xresources"
alias bashrc="vim ~/.bashrc && source ~/.bashrc"
alias reloadrc="source ~/.bashrc"
#alias cours='cd ~/Documents/_Cours/'
#alias work='cd ~/Documents/_WORK/'
#alias serveur='tsclient -x ~/.tsclient/serveur.rdp'
#alias annie='tsclient -x ~/.tsclient/annie.rdp'
#alias restartx='sudo /etc/init.d/gdm restart'
#alias stopx='sudo /etc/init.d/gdm stop'
#alias gvim="~/cmd/open.sh"
alias aspell="aspell --lang=fr_FR --encoding=iso8859-1 check"
alias open="~/.bin/open.sh"
#alias pdflatex="~/cmd/pdflatex.sh"
#alias s="sudo shutdown -h 0"
alias s="screen"
#alias sl="screen -list"
alias restart="sudo shutdown -r 0"
alias gcc2="gcc -Wall -Wextra -m32 -g -std=c99 -o"
alias n="nautilus --no-desktop ./"
alias u="urxvt &"
alias d="dolphin ./"
alias ms="ecryptfs-add-passphrase"
alias msecure="ecryptfs-add-passphrase && mount -i Secure/"
#alias eclipse="/home/ombr/eclipse/eclipse &"
alias gut="cd ~/public_html/Gutenborg-V3/"
alias gut2="cd ~/public_html/testing-Gutenborg-V3/"
alias usr="cd ~/public_html/usr/users/"
alias nfirefox="firefox -no-remote -P blank"
#alias sms="sudo ~/android/tools/adb shell am start -a android.intent.action.MAIN -n com.grrzzz.remotesmsfull/.RemoteSMS && ~/android/tools/adb forward tcp:8080 tcp:8080 && sleep 5s && firefox 127.0.0.1:8080"
alias sms="sudo ~/android/tools/adb forward tcp:8080 tcp:8080 && firefox 127.0.0.1:8080"
#alias adb="sudo ~/android/tools/adb"
ensibm='boissayl@ensibm.imag.fr'
eee='ssh -X 192.168.0.13 \"echo "bonjour"; sleep 1s; x2x -east -to :0.0;\"'
#alias projet="cd /home/ombr/Documents/_Cours/Projets"
alias nmr="sudo /etc/rc.d/networkmanager restart"
mycd(){
	cd "$@" && ls
}
alias cd=mycd
alias migrate='bundle exec rake db:migrate && bundle exec rake RAILS_ENV=test db:migrate'
#do not need to type cd in bash to change directory :-D
shopt -s autocd
#man bash
shopt -s cdspell
shopt -s dirspell

alias f=fg
alias v="gvim --servername VIM"
alias ranger="export EDITOR=\"/usr/bin/vim --servername VIM --remote-tab\"; ranger"
alias r='ranger'
alias vv="while true; do vim --servername VIM; done;"
alias apal="tail -f /var/log/apache2/error.log"
alias apar="sudo service apache2 restart"
alias apaini="svim /etc/php5/apache2/php.ini"

alias etc="cd /etc"
export PATH=${PATH}":~/node_modules/.bin/"

#Android :
export PATH=${PATH}":~/android/tools"

export PAGER=less

export EDITOR=vim
export VISUAL=vim

export PATH=$PATH:"/home/ombr/public_html/lls/bin/"
#i3-msg border 1pixel >/dev/null

#auto completion sur sudo
complete -cf sudo
complete -cf man

#faster auto completion
set show-all-if-ambiguous on
set show-all-if-unmodified on

# privileged access
if [ $UID -ne 0 ]; then
    alias sudo='sudo '
    alias scat='sudo cat'
    alias svim='sudo vim'
    alias root='sudo su'
    alias reboot='sudo reboot'
    alias halt='sudo halt'
    alias update='sudo pacman -Su'
    alias netcfg='sudo netcfg2'
fi


alias da='date "+%A, %B %d, %Y [%T]"'
alias du1='du --max-depth=1 -h'
alias hist='history | grep $1'      # requires an argument
alias openports='netstat --all --numeric --programs --inet --inet6'
alias pg='ps -Af | grep $1'         # requires an argument (note: /usr/bin/pg is installed by the util-linux package; maybe a different alias name should be used)

alias gitp='git add -p && git commit -v'
alias gitc='git commit'
alias gitcp='git cherry-pick'
alias gits='git status'
alias save='git commit -a -m "save"'
alias restore='git reset HEAD^'
alias c='clear'
#~/.bin/screen.sh

export CDPATH="~:~/public_html/:/etc/"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Rails faster
#export RUBY_HEAP_MIN_SLOTS=800000
#export RUBY_HEAP_FREE_MIN=100000
#export RUBY_HEAP_SLOTS_INCREMENT=300000
#export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
#export RUBY_GC_MALLOC_LIMIT=79000000


export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

bind '"\e[1;0C":forward-word'
bind '"\e[1;0D":backward-word'
set -o vi
