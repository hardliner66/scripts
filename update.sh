#!/bin/bash

base_dir=$(dirname "${BASH_SOURCE[0]}")

# copy all configs into ~/.config
cp -r -f $base_dir/config/* ~/.config/

cp $base_dir/tmux.conf ~/.tmux.conf
cp -r $base_dir/cargo/* ~/.cargo

# reload i3
i3-msg reload > /dev/null
i3-msg restart > /dev/null

# install all vim plugins
nvim +'PackerClean!' +'PackerInstall' +'qa'
