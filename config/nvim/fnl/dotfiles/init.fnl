(module dotfiles.init
  {autoload {nvim aniseed.nvim
             util dotfiles.util}})

(def- cmd util.cmd)

(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader " ")

(require :dotfiles.core)
(require :dotfiles.plugin)
(require :dotfiles.mapping)

(cmd "source ~/.config/nvim/config.vim")
