let mapleader = " "

set tabstop=4
set shiftwidth=4
set nobackup
set nowritebackup
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
set hidden

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

set relativenumber
set number

if ! exists("g:use_async_vrun")
    let g:use_async_vrun = 0
endif

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
nnoremap <silent><leader><leader>k :bn!<CR>
nnoremap <silent><leader>j :bp<CR>
nnoremap <silent><leader><leader>j :bp!<CR>
nnoremap <silent><leader>d :bd<CR>
nnoremap <silent><leader><leader>d :bd!<CR>
nnoremap <silent><leader>w :w<CR>
" nnoremap <silent><leader>wq :wq<CR>
nnoremap <silent><leader>q :q<CR>
nnoremap <silent><leader>o gf<ESC>

" force quit with non-zero exit code
nnoremap <silent><leader><leader>q :cq!<CR>
" nnoremap <silent><leader><leader>wq :w<CR>:cq<CR>
nnoremap <silent><leader>co :copen<CR>

nnoremap <leader>cc :!cargo clean<cr>
nnoremap <leader>cb :!cargo build<cr>
nnoremap <leader>cbr :!cargo build --release<cr>
nnoremap <leader>ct :!cargo test<cr>
nnoremap <leader>cr :!cargo run<cr>
nnoremap <leader>crr :!cargo run --release<cr>
nnoremap <leader>ca :!cargo add 

nnoremap <leader>cf :!cargo fmt<cr>

" Edit vimr configuration file
nnoremap <Leader>ve :e $MYVIMRC<CR>
" " Reload vimr configuration file
nnoremap <Leader>vr :source $MYVIMRC<CR>

" -----------------------------------------------------------------------------
"     - Grepping -
"     Grepping with ripgrep.
"     If you don't have ripgrep installed you are in trouble!
" -----------------------------------------------------------------------------
set grepprg=rg\ --vimgrep

function RipGrepping(search_term)
    silent! exe 'grep! -i -F "' . a:search_term . '"'
    redraw!
    if len(getqflist()) > 0 
        :copen
    endif
endfunction
command! -nargs=* Find call RipGrepping(<q-args>)

nmap <C-f> :Find 

cmap w!! w !sudo /run/current-system/sw/bin/tee > /dev/null %
