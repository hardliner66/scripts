(module dotfiles.plugin.telescope
  {autoload {nvim aniseed.nvim
             util dotfiles.util}})

(def- nnoremap util.noremap)
(def- nnoremaps util.noremaps)

; Find files using Telescope command-line sugar.
(nnoremaps :n :<leader>ff "<cmd>Telescope find_files<cr>")
(nnoremaps :n :<leader>fg "<cmd>Telescope live_grep<cr>")
(nnoremaps :n :<leader>fb "<cmd>Telescope buffers<cr>")
(nnoremaps :n :<leader>fh "<cmd>Telescope help_tags<cr>")
