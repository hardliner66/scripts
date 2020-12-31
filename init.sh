#!/bin/bash
# rebind caps-lock to escape
sudo localectl set-x11-keymap de "" "nodeadkeys" caps:escape

if command -v pacman &> /dev/null
then
  sudo pacman -S --noconfirm base-devel discord polybar fakeroot binutils rofi fish i3-gaps xorg xorg-xinit xterm jq xsel xclip nodejs npm dmenu opusfile miniupnpc fzf neofetch alacritty
  sudo pacman -R --noconfirm mesa-demos lib32-mesa-demos

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
