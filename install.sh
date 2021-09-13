#!/bin/bash

if command -v pacman &> /dev/null
then
  sudo pacman -Sy base-devel discord polybar fakeroot binutils rofi fish \
                  i3-gaps xorg xorg-xinit xterm jq xsel xclip nodejs npm \
                  dmenu opusfile miniupnpc fzf neofetch kitty alacritty nitrogen \
                  entr python3 screen bat exa fd tokei paru neovim
  sudo pacman -R --noconfirm mesa-demos lib32-mesa-demos
  chsh -s /usr/bin/fish

  mkdir -p ~/aur-packages
  pushd ~/aur-packages
    paru -S --noconfirm snapd
    paru -S --noconfirm procs
    paru -S --noconfirm xxd-standalone
	paru -S --noconfirm ttf-jetbrains-mono
    paru -S --noconfirm nerd-fonts-fira-code 
    paru -S --noconfirm nodejs 
    paru -S --noconfirm npm
    paru -S --noconfirm ripgrep
    sudo systemctl enable --now snapd.socket
    sudo ln -s /bar/lib/snapd/snap /snap
  popd
  python3 -m pip install --user --upgrade pynvim
fi

# install vim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# install tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# call ./install.sh from the directory the script is in
pushd $(dirname "${BASH_SOURCE[0]}")
./update.sh

npm config set prefix ~/.npm

~/.tmux/plugins/tpm/bin/install_plugins

# reboot to get the keyboard stuff working
reboot
