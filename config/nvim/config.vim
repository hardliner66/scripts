function! s:openFishShell()
	let old_shell = &shell
	let &shell = '/usr/bin/fish'
	execute ":term"
	execute "normal! i"
	let &shell = old_shell
endfunction

command! -nargs=0 Fish call s:openFishShell()

augroup goodbye_netrw
  au!
  autocmd VimEnter * silent! au! FileExplorer *
augroup END

" augroup format_markdown
" autocmd BufWritePre *.md normal ":TableFormat"
" augroup END

function! s:loadEnv()
    if filereadable(".env")
        Dotenv .
    endif
endfunction

command! -nargs=0 LoadEnv call s:loadEnv()

augroup dotenv
    au VimEnter * LoadEnv
augroup END

" Lightline
let g:lightline = {
  \     'colorscheme': 'powerlineish',
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
  \ }

filetype plugin indent on
syntax on

highlight Normal guifg=#b5b5aa guibg=#181818
highlight Visual guifg=#f0f0e1 guibg=#484848
highlight LineNr guifg=#9e9e95 guibg=#181818
highlight CursorLineNr guifg=#a0a0a0 guibg=#303030
highlight Pmenu guifg=#f0f0e1 guibg=#101010

highlight CocErrorSign guifg=#aa0000
highlight CocHintSign guifg=#15889d

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"inoremap <Up> <Nop>
"inoremap <Down> <Nop>
"inoremap <Left> <Nop>
"inoremap <Right> <Nop>
"
" -----------------------------------------------------------------------------
"     - Rust help -
" -----------------------------------------------------------------------------
function! RustDocs()
    let l:word = expand("<cword>")
    :call RustMan(word)
endfunction

function! RustMan(word)
    let l:command  = ':term rusty-man ' . a:word
    execute command
endfunction

:command! -nargs=1 Rman call RustMan(<f-args>)
nmap <leader>rd :call RustDocs()<CR>

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

augroup last_cursor_position
    autocmd!
    autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit' | execute "normal! g`\"zvzz" | endif
augroup END

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" " vim -b : edit binary using xxd-format!
" augroup Binary
"   au!
"   au BufReadPre   *.bin,*.exe let &bin=1
"   au BufReadPost  *.bin,*.exe if &bin | %!xxd
"   au BufReadPost  *.bin,*.exe set ft=xxd | endif
"   au BufWritePre  *.bin,*.exe if &bin | %!xxd -r
"   au BufWritePre  *.bin,*.exe endif
"   au BufWritePost *.bin,*.exe if &bin | %!xxd
"   au BufWritePost *.bin,*.exe set nomod | endif
" augroup END

function InlineCommand(mode)
    let l:cmd = input('Command: ')
    let l:output = system(l:cmd)
    let l:output = substitute(l:output, '[\r\n]*$', '', '')
    execute 'normal ' . a:mode . l:output
endfunction

nmap <silent> \e :call InlineCommand('i')<CR>
nmap <silent> \E :call InlineCommand('a')<CR>

cmap w!! w !sudo /run/current-system/sw/bin/tee > /dev/null %
