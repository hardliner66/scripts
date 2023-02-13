#!/bin/bash

base_dir=$(dirname "${BASH_SOURCE[0]}")

# copy all configs into ~/.config
cp -r -f $base_dir/config/* ~/.config/

cp $base_dir/tmux.conf ~/.tmux.conf
cp -r $base_dir/cargo/* ~/.cargo

# install all vim plugins
nvim +'PackerSync' +'qa'

# if command -v i3-msg &> /dev/null
# then
  # reload i3
  # sh -c '[ $(echo "YES" | dmenu -sb "#ff6600" -i -p "Do you want to reload i3 as well? Press [ESC] to cancel.") = "YES" ] && i3-msg reload &> /dev/null && i3-msg restart &> /dev/null' &> /dev/null
# fi
