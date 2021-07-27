(module dotfiles.plugin.vrun
  {autoload {
             nvim aniseed.nvim
             util dotfiles.util}})

(def- nnoremaps util.nnoremaps)

(set nvim.g.use_async_vrun 1)

(nnoremaps :<leader>r ":VRunAsync<cr>")
(nnoremaps :<leader>s ":VRun<cr>")
