#!/bin/zsh

# Git
alias gs="git stash"
alias gbd="git build"
alias gbw="git build-without-master"
alias gsp="git smart-pull"

# Pow
alias pr="touch ~/.pow/restart.txt"

# Bundler (Undo harmful from oh-my-zsh)
alias zeus > /dev/null && unalias zeus

# Rails
alias rdm='rake db:migrate && rake db:test:prepare'

# Zeus
alias zr='zeus rspec'
alias zc='zeus console'
alias zs='zeus start'
alias z='zeus'

# Quick look

alias ql='qlmanage -p "$@" >& /dev/null'

