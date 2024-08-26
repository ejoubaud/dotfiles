#!/bin/zsh	

# Git	
alias gs="git stash"	
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
alias ql='qlmanage -p "$@" >& /dev/null'	

# AWS Vault	
alias ave='aws-vault exec'

# Lazygit
alias lg=lazygit