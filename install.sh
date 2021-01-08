#!/bin/bash

if command -v pacman &> /dev/null
then
  sudo pacman -Sy base-devel discord polybar fakeroot binutils rofi fish \
                  i3-gaps xorg xorg-xinit xterm jq xsel xclip nodejs npm \
                  dmenu opusfile miniupnpc fzf neofetch alacritty nitrogen \
                  entr python3 screen
  sudo pacman -R --noconfirm mesa-demos lib32-mesa-demos
  chsh -s /usr/bin/fish

  mkdir -p ~/aur-packages
  pushd ~/aur-packages
    git clone https://aur.archlinux.org/neovim-nightly.git
    pushd neovim-nightly
      makepkg --noconfirm -si
    popd
    git clone https://aur.archlinux.org/snapd.git
    pushd snapd
      makepkg --noconfirm -si
    popd
    sudo systemctl enable --now snapd.socket
    sudo ln -s /bar/lib/snapd/snap /snap
  popd
  python3 -m pip install --user --upgrade pynvim
fi

# install vim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# call ./install.sh from the directory the script is in
pushd $(dirname "${BASH_SOURCE[0]}")
./install.sh

npm config set prefix ~/.npm

# reboot to get the keyboard stuff working
reboot
