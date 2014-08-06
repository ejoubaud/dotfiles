#!/bin/zsh

# For envato's Boxen
[[ -f /opt/boxen/env.sh ]] && source /opt/boxen/env.sh

# --- Aliases ---

# Start an upgraded rails on master
alias sr="git checkout master && git smart-pull && (bundle install --local) && rake db:migrate && bundle exec foreman start web"


