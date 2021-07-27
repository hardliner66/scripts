# -g means global, but shouldn't matter if in config.fish
# -x means export to sub processes
set -g -x DIRENV_LOG_FORMAT ""
set -g -x EDITOR nvim
set -g -x VISUAL nvim
set -g -x ANDROID_HOME /opt/android-sdk
set -g -x ANDROID_NDK_HOME /opt/android-ndk

# eval (direnv hook fish)

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
alias tw 'timew'

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

set -x PATH $PATH ~/.npm/bin
set -x PATH $PATH ~/go/bin
set -x PATH $PATH ~/scripts
set -x PATH $PATH ~/.gem/ruby/2.7.0/bin
set -x PATH $PATH ~/.nimble/bin
set -x PATH /home/steve/.local/share/ponyup/bin $PATH

set SECRETS_FILE ~/.config/fish/secrets.fish
if test -e $SECRETS_FILE
  source $SECRETS_FILE
end
set -e SECRETS_FILE

function fish_greeting
end

function fish_prompt
end

starship init fish | source
