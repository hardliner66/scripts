(module dotfiles.plugin.whichkey
  {autoload {nvim aniseed.nvim
             util dotfiles.util}})

(def- nnoremaps util.nnoremaps)

(nnoremaps :<leader> ":WhichKey '<Space>'<CR>")
