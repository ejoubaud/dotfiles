#!/usr/bin/env fish

# anyenv
if type anyenv > /dev/null
  set -Ux fish_user_paths $HOME/.anyenv/bin $fish_user_paths
end
