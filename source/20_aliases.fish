#!/usr/bin/env fish

# Git
alias gs="git stash"
alias gbd="git build"
alias gbw="git build-without-master"
alias gsp="git smart-pull"

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
alias ql='qlmanage -p "$argv" >& /dev/null'

# AWS Vault
alias ave='aws-vault exec'
