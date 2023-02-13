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
alias hx 'helix'
alias ll 'exa -l'
alias la 'exa -la'
alias cat 'bat'
alias tcc 'tccst'
alias ts twitch-send
alias nix-shell 'command nix-shell --command fish'
alias nix-dev 'command nix develop --command fish'
alias ztl 'zettl'
alias s 'kitty +kitten ssh'
alias pmc 'coyote test'
alias nez 'java -jar /usr/local/lib/nez.jar'
alias inez 'java -jar /usr/local/lib/nez.jar inez'
alias ilem 'lem --eval "(lem-lisp-mode:start-lisp-repl t)"'
alias vl 'docker run --user=(id -u):(id -u) -e CL_IMPLEMENTATION=sbcl --net=host --rm -it -v /home/steve:/home/steve -v (pwd):/mnt justin2004/slimv_box'

abbr g 'git'
abbr scripts 'cd ~/scripts'
abbr x 'exit'
abbr c 'clear'
abbr cdd 'cd -'
abbr pj 'pijul'
abbr i 'sudo apt install'
abbr u 'sudo apt update && sudo apt upgrade'
abbr pio 'platformio'
abbr wa 'watson'
abbr t 'task'
abbr ts 'tasksh'
abbr ti 'timew'
abbr ca 'cargo add'

# Fish fzf
begin
    set --local FZF_PATH /usr/share/fish/vendor_functions.d/fzf_key_bindings.fish
    if test -e $FZF_PATH
        set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --glob "!.git/*"'
        fzf_key_bindings
    end
end

bind \cb 'fbr'

set -x FLYCTL_INSTALL ~/.fly
set -x MPS_JDK "/opt/MPS 2021.3/jbr/"

set -x PATH $PATH /opt/riscv/bin
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
set -x PATH $PATH ~/opt/GNAT/2021-arm-elf/bin
set -x PATH $PATH ~/opt/GNAT/arm-gnueabihf//bin
set -x PATH $PATH $FLYCTL_INSTALL/bin
set -x PATH $PATH ~/.platformio/penv/bin
set -x PATH $PATH ~/.ghcup/bin/
set -x PATH $PATH /home/steve/.wasmer/bin/
set -x PATH $PATH ~/.roswell/bin
set -x PATH $PATH ~/.emacs.d/bin

# set -x RUSTC_WRAPPER /usr/bin/sccache

# set -x PATH /usr/lib/linux-tools/5.8.0-63-generic $PATH

set source_file ~/.nix-profile/etc/profile.d/nix.sh
if test -e "$source_file"
  fenv source "$source_file"
end

set source_file ~/.bashrc.taste
if test -e "$source_file"
  fenv "$source_file"
end

eval (direnv hook fish)

thefuck --alias k | source
bind \cf 'k'

# export GUIX_PROFILE="$HOME/.guix-profile"
# export GUIX_LOCPATH="$GUIX_PROFILE/lib/locale"
# fenv source "$GUIX_PROFILE/etc/profile"

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

if status is-interactive
starship init fish | source
  # atuin init fish | source
end

# opam configuration
source /home/steve/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
