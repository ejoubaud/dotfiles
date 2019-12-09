#!/usr/bin/env fish

# Git
alias gs="git stash"
alias gbd="git build"
alias gsp="git smart-pull"
alias gst="git status"
alias gco="git checkout"

function current_branch
  set ref (git symbolic-ref HEAD 2> /dev/null); or \
  set ref (git rev-parse --short HEAD 2> /dev/null); or return
  echo $ref | sed s-refs/heads/--
end

alias ggpush='git push origin (current_branch)'

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
