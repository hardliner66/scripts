" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin()

" Make sure you use single quotes

" File tree
Plug 'scrooloose/nerdtree'

" Plugin to help surrond stuff with other stuff
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Language Server Client
Plug 'autozimu/LanguageClient-neovim', {
\ 'branch': 'next',
\ 'do': 'bash install.sh',
\ }
let g:LanguageClient_serverCommands = {
\ 'rust': ['rust-analyzer'],
\ }

Plug 'rust-lang/rust.vim',         { 'for': 'rust' }
Plug 'dense-analysis/ale'
Plug 'ap/vim-buftabline'

Plug 'luochen1990/rainbow'
Plug 'jiangmiao/auto-pairs'

Plug 'cespare/vim-toml'

" themes
" Plug 'lewis6991/moonlight.vim'
Plug 'nightsense/office'
" Plug 'nightsense/carbonized'
" Plug 'whatyouhide/vim-gotham'
" Plug 'mhartington/oceanic-next'
" Plug 'morhetz/gruvbox'
" Plug 'ayu-theme/ayu-vim'
" Plug 'chuling/ci_dark'
" Plug 'cocopon/iceberg.vim'
"Initialize plugin system
call plug#end()
" set termguicolors     " enable true colors support

syntax on
set termguicolors
colorscheme office-dark
"colorscheme monokai_pro
" colorscheme moonlight
" colorscheme gruvbox
" colorscheme ci_dark
" colorscheme iceberg
" colorscheme gotham
" colorscheme OceanicNext

let g:NERDTreeWinPos = "right"

source ~/.config/nvim/defaults.vim
