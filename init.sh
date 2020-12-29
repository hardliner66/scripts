#!/bin/bash
# rebind caps-lock to escape
sudo localectl set-x11-keymap de "" "nodeadkeys" caps:escape

# install vim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# call ./install.sh from the directory the script is in
pushd $(dirname "${BASH_SOURCE[0]}")
./install.sh

# reboot to get the keyboard stuff working
reboot
