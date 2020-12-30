# -g means global, but shouldn't matter if in config.fish
# -x means export to sub processes
set -g -x DIRENV_LOG_FORMAT ""
set -x EDITOR nvim
# eval (direnv hook fish)

alias v nvim

function vc
  pushd ~/scripts
  nvim ~/scripts/$argv && ~/scripts/install.sh
  popd
end

# Fish fzf
begin
    set --local FZF_PATH /usr/share/fish/vendor_functions.d/fzf_key_bindings.fish
    if test -e $FZF_PATH
        set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --glob "!.git/*"'
        fzf_key_bindings
    end
end

set -U fish_user_paths ~/.npm/bin

set SECRETS_FILE ~/.config/fish/secrets.fish
if test -e $SECRETS_FILE
  source $SECRETS_FILE
end
set -e SECRETS_FILE
