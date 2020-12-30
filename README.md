# These are my scripts and dotfiles

Clone the repo into ~/scripts
Then run ~/scripts/init.sh

# Updating
do a git pull and run ~/scripts/install.sh

# Fish
## Config
- fzf integration
- load secrets file if it exists
- sets $EDITOR to nvim

## Aliases/Functions
### v
Alias for nvim

### vc
Opens nvim in the ~/scripts/config folder

There is an autocomplete script for vc, which lists all files inside of ~/scropts/config, except .git

# i3
## General
- $mod is set to windows key (the alt key interferes with firefox shortcuts)
- uses polybar as statusbar
- gap size is 7
- uses nitrogen to set background image
- automatically enables HDMI2 to the right of the main monitor

## Custom Shortcuts
- $mod+Return       => opens alacritty
- $mod+Shift+Return => opens a private alacritty window
- $mod+Shift+Tab    => swaps the screens
- $mod+Shift+S      => make a screenshot with selection in scrot and copy it into the clipboard
- $mod+S            => make a screenshot of the whole screen in scrot and copy it into the clipboard
- $mod+Shift+P      => open rofi
- $mod+Shift+E      => send i3-msg exit with confirmation
- $mod+Shift+F4     => shutdown with confirmation

# nvim
## General
- config is split into two files: init.vim & defaults.vim
- init.vim contains plugins and themes
- defaults.vim contains general settings and keybindings

## Keybinds
leader is set to space

- \<leader\>n          => toggle line number
- \<leader\>w          => save
- \<leader\>wq         => save and quit
- \<leader\>q          => quit
- \<leader\>\<leader\>q  => quit with non zero exit code (this can be used to quit out of vc without triggering a reload)
- \<leader\>\<leader\>wq => save and quit with non zero exit code (this can be used to quit out of vc without triggering a reload)
- \<leader\>o          => open file under cursor 
