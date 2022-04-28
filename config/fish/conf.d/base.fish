# -g means global, but shouldn't matter if in config.fish
# -x means export to sub processes
set -g -x DIRENV_LOG_FORMAT ""
set -g -x EDITOR nvim
set -g -x VISUAL nvim
set -g -x ANDROID_HOME /opt/android-sdk
set -g -x ANDROID_NDK_HOME /opt/android-ndk

alias c 'cd'
alias v 'nvim'
alias v. 'nvim -c "Telescope find_files" .'
alias vu 'nvim +"PackerClean!" +"PackerUpdate" +"qa"'
alias ls 'exa'
alias ll 'exa -l'
alias la 'exa -la'
alias cat 'bat'
alias grep 'rg'
alias tcc 'tccst'
alias ts twitch-send
alias ti 'timew'
alias t 'task'
alias nix-shell 'command nix-shell --command fish'
alias nix-dev 'command nix develop --command fish'
alias ztl 'zettl'

abbr g 'git'
abbr scripts 'cd ~/scripts'
abbr x 'exit'
abbr c 'clear'
abbr cdd 'cd -'

# Fish fzf
begin
    set --local FZF_PATH /usr/share/fish/vendor_functions.d/fzf_key_bindings.fish
    if test -e $FZF_PATH
        set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --glob "!.git/*"'
        fzf_key_bindings
    end
end

bind \cb 'fbr'

set -x PATH $PATH ~/.npm/bin
set -x PATH $PATH ~/.cargo/bin
set -x PATH $PATH ~/scripts
set -x PATH $PATH ~/bin
set -x PATH $PATH ~/go/bin
set -x PATH $PATH /usr/local/go/bin
set -x PATH $PATH ~/.fluvio/bin
set -x PATH $PATH ~/.local/share/ponyup/bin
set -x PATH $PATH ~/NuSMV-2.6.0-Linux/bin/
set -x PATH $PATH ~/.local/bin
set -x PATH $PATH ~/.vino/bin
set -x PATH $PATH ~/projects/odin/Odin
set -x PATH $PATH ~/j90x/bin
set -x PATH $PATH ~/opt/GNAT/2021/bin
if test -e '~/.nix-profile/etc/profile.d/nix.sh'
  fenv source '~/.nix-profile/etc/profile.d/nix.sh'
end

eval (/home/steve/.nix-profile/bin/direnv hook fish)

thefuck --alias k | source
bind \cf 'k'

export GUIX_PROFILE="$HOME/.guix-profile"
export GUIX_LOCPATH="$GUIX_PROFILE/lib/locale"
fenv source "$GUIX_PROFILE/etc/profile"

set SECRETS_FILE ~/.config/fish/secrets.fish
if test -e $SECRETS_FILE
  source $SECRETS_FILE
end
set -e SECRETS_FILE

function fish_greeting
end

function fish_prompt
end

source ~/.asdf/asdf.fish

# nvm use latest
load_nvm

starship init fish | source

# opam configuration
source /home/steve/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
