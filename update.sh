#!/bin/bash

# copy all configs into ~/.config
cp -r -f $(dirname "${BASH_SOURCE[0]}")/config/* ~/.config/

cp tmux.conf ~/.tmux.conf

# reload i3
i3-msg reload > /dev/null
i3-msg restart > /dev/null

# install all vim plugins
nvim +'PlugClean!' +'PlugInstall' +'qa'
