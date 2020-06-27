bindkey -e

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh/ $fpath)

if [ -f ${HOME}/.zsh/git-prompt.sh ]; then
        source ${HOME}/.zsh/git-prompt.sh
fi

autoload -Uz compinit && compinit -i

setopt auto_cd

# コマンド履歴
HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="${debian_chroot:+($debian_chroot)}%n[%~] $ "
    ;;
*)
    ;;
esac

#function rprompt-git-current-branch {
#  local branch_name st branch_status
#
#  if [ ! -e  ".git" ]; then
#    # git 管理されていないディレクトリは何も返さない
#    return
#  fi
#  branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
#  st=`git status 2> /dev/null`
#  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
#    # 全て commit されてクリーンな状態
#    branch_status="%F{green}"
#  elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
#    # git 管理されていないファイルがある状態
#    branch_status="%F{red}?"
#  elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
#    # git add されていないファイルがある状態
#    branch_status="%F{red}+"
#  elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
#    # git commit されていないファイルがある状態
#    branch_status="%F{yellow}!"
#  elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
#    # コンフリクトが起こった状態
#    echo "%F{red}!(no branch)"
#    return
#  else
#    # 上記以外の状態の場合
#    branch_status="%F{blue}"
#  fi
#  # ブランチ名を色付きで表示する
#  echo "${branch_status}[$branch_name]"
#}

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
# setopt prompt_subst

# プロンプトの右側にメソッドの結果を表示させる
# RPROMPT='`rprompt-git-current-branch`'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

PATH=$PATH:~/android-sdk/sdk/platform-tools:~/android-studio/bin
# $HOME/sandbox/nave/nave.sh use latest
JAVA_HOME=/usr/lib/jvm/jdk1.7.0/

function share_history {
    history -a
    history -c
    history -r
}
PROMPT_COMMAND='share_history'
export HISTSIZE=9999

alias w3m='w3m -o display_image=true'

case "${OSTYPE}" in
darwin*)
  alias ls="ls -G"
  alias ll="ls -lG"
  alias la="ls -laG"
  ;;
linux*)
  alias ls='ls --color'
  alias ll='ls -l --color'
  alias la='ls -la --color'
  ;;
esac

NODE_PATH='/usr/lib/node_modules'

# RVM
[ -s ${HOME}/.rvm/scripts/rvm ] && source ${HOME}/.rvm/scripts/rvm

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
eval "$(rbenv init -)"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"

if [[ $TMUX ]]; then source ~/.tmux-git/tmux-git.sh; fi

export GOPATH=$HOME/go
export PYTHONPATH="/usr/local/lib/python2.7/site-packages/:$PYTHONPATH"
export PATH=./bin:$PATH
export PATH="$PATH:`pwd`/flutter/bin"
export PATH="$PATH":"$HOME/sandbox/flutter/.pub-cache/bin"
export PATH="$HOME/.nodenv/bin:$PATH"

eval "$(nodenv init -)"

stty stop undef
stty start undef

 source /Users/issei_n/github/www/.docker-lightrc
export PATH="/usr/local/opt/openjdk/bin:$PATH"

setopt nonomatch
