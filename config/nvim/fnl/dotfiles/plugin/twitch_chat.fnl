(module dotfiles.plugin.twitch_chat
  {autoload {
             nvim aniseed.nvim
             util dotfiles.util}})

(set nvim.g.twitch_scratch_autosend 1)
(set nvim.g.twitch_chat_name_filter ["iamhardliner" "iamhardbot" "pretzelrocks"])
