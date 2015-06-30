#!/bin/zsh

# For envato's Boxen
[[ -f /opt/boxen/env.sh ]] && source /opt/boxen/env.sh

# --- Aliases ---

# Start an upgraded rails on master
alias srm="git checkout master && git smart-pull && (bundle install --local) && bundle exec spring binstub --all && bin/rake db:migrate && bundle exec foreman start web"
alias sr="git checkout master && git smart-pull && (bundle install --local) && bin/rake db:migrate && bundle exec foreman start web"

# Needed for AWS auto-scaling
export AWS_AUTO_SCALING_HOME="/opt/boxen/homebrew/Cellar/auto-scaling/1.0.61.6/libexec"
export JAVA_HOME="`/usr/libexec/java_home`"
