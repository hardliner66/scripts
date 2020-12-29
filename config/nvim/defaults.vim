let mapleader = " "

set tabstop=2
set shiftwidth=2
set expandtab
set whichwrap+=<,>,h,l,[,]
set incsearch
set ignorecase
set smartcase
set smartindent
set wildmenu
set wildmode=full
set foldmethod=indent
set foldenable
set foldlevelstart=10
set foldnestmax=10
" set ruler
set laststatus=2
set splitright
set splitbelow
set backspace=indent,eol,start
set nowrap
set nohlsearch
set ttimeoutlen=10
set mouse=
set noswapfile
"set colorcolumn=110
"set nosmd
"set hidden

set relativenumber
set number

nnoremap <leader>n :set invnumber invrelativenumber<CR>

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"inoremap <Up> <Nop>
"inoremap <Down> <Nop>
"inoremap <Left> <Nop>
"inoremap <Right> <Nop>

nnoremap <silent><leader>k :bn<CR>
nnoremap <silent><leader>j :bp<CR>
nnoremap <silent><leader>d :bd<CR>
nnoremap <silent><leader>w :w<CR>
nnoremap <silent><leader>q :q<CR>

" force quit with non-zero exit code
nnoremap <silent><leader><leader>q :cq!<CR>
nnoremap <silent><leader>o gf<ESC>

nnoremap <leader>ef :!cargo build<cr>

" Edit vimr configuration file
nnoremap <Leader>ve :e $MYVIMRC<CR>
" " Reload vimr configuration file
nnoremap <Leader>vr :source $MYVIMRC<CR>

cmap w!! w !sudo /run/current-system/sw/bin/tee > /dev/null %
