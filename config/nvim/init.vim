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

" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'rust-lang/rust.vim',         { 'for': 'rust' }
Plug 'dense-analysis/ale'
Plug 'ap/vim-buftabline'

Plug 'luochen1990/rainbow'
Plug 'jiangmiao/auto-pairs'

Plug 'cespare/vim-toml'
Plug 'vimwiki/vimwiki'

" themes
Plug 'nightsense/office'
call plug#end()

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>F2 <Plug>(coc-rename)

set nocompatible
filetype plugin on
syntax on

set termguicolors
colorscheme office-dark

let g:NERDTreeWinPos = "right"

highlight Normal guifg=#b5b5aa guibg=#181818
highlight LineNr guifg=#9e9e95 guibg=#181818
highlight CursorLineNr guifg=#a0a0a0 guibg=#303030
highlight Pmenu guifg=#f0f0e1 guibg=#101010
highlight CocErrorSign guifg=#aa0000
highlight CocHintSign guifg=#15889d

nmap <silent> <leader>h :CocCommand rust-analyzer.toggleInlayHints<cr>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" auto import
nmap <silent> <M-Enter> <Plug>(coc-codeaction)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

source ~/.config/nvim/defaults.vim
