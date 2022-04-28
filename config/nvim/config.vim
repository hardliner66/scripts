runtime config.lua

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

function! EnableRainbow()
  execute ":RainbowParenthesesToggle"
  augroup Rainbow
    au Syntax   * RainbowParenthesesLoadRound
    au Syntax   * RainbowParenthesesLoadSquare
    au Syntax   * RainbowParenthesesLoadBraces
    au Syntax   * RainbowParenthesesLoadChevrons
  augroup END
endfunction

augroup EnableRainbow
  au VimEnter * if exists(":RainbowParenthesesToggle") | call EnableRainbow() | endif
augroup END

highlight Normal guifg=#b5b5aa guibg=#181818
highlight Visual guifg=#f0f0e1 guibg=#484848
highlight LineNr guifg=#9e9e95 guibg=#181818
highlight CursorLineNr guifg=#a0a0a0 guibg=#303030
highlight Pmenu guifg=#f0f0e1 guibg=#101010

highlight CocErrorSign guifg=#aa0000
highlight CocHintSign guifg=#15889d

let g:coc_global_extensions = ['coc-tabnine', 'coc-rust-analyzer']

nnoremap <leader>a :CocAction<cr>

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>F2 <Plug>(coc-rename)

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

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-n> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-n>"
  nnoremap <silent><nowait><expr> <C-p> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-p>"
  inoremap <silent><nowait><expr> <C-n> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-p> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-n> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-n>"
  vnoremap <silent><nowait><expr> <C-p> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-p>"
endif

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

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


function Frolint()
    silent! cex system('frolint --editor')
    redraw!
    if len(getqflist()) > 0 
        :copen
    endif
endfunction
command! -nargs=* FrolintLint call Frolint()

nmap <leader>l :Frolint<cr>

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

cmap w!! w !sudo /run/current-system/sw/bin/tee > /dev/null %
