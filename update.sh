#!/bin/bash

base_dir=$(dirname "${BASH_SOURCE[0]}")

# copy all configs into ~/.config
cp -r -f $base_dir/config/* ~/.config/

cp $base_dir/tmux.conf ~/.tmux.conf
cp -r $base_dir/cargo/* ~/.cargo

if command -v i3-msg &> /dev/null
then
	# reload i3
	i3-msg reload 2>&1 > /dev/null
	i3-msg restart 2>&1 > /dev/null
fi

# install all vim plugins
nvim +'PackerSync' +'qa'
