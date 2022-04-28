(module dotfiles.mapping
  {autoload {nvim aniseed.nvim
             core aniseed.core
             util dotfiles.util}})

(def- nnoremap util.nnoremap)
(def- nnoremaps util.nnoremaps)
(def- cmd util.cmd)

;; Generic mapping configuration.

(nnoremap :<leader>n ":set invnumber invrelativenumber<cr>")

;; Spacemacs style leader mappings.
(nnoremaps :<leader>k ":bn<cr>")
(nnoremaps :<leader><leader>k ":bn!<CR>")
(nnoremaps :<leader>j ":bp<CR>")
(nnoremaps :<leader><leader>j ":bp!<CR>")
(nnoremaps :<leader>d ":bd<CR>")
(nnoremaps :<leader><leader>d ":bd!<CR>")
(nnoremaps :<leader>w ":w<CR>")
(nnoremaps :<leader>o "gf<ESC>")

(nnoremaps :<leader><leader>q ":cq!<CR>")
(nnoremaps :<leader>co ":copen<CR>")
(nnoremap :<leader>n  ":cn<cr>")
(nnoremap :<leader>p  ":cp<cr>")

(nnoremap :<leader>cc  ":!cargo clean<cr>")
(nnoremap :<leader>cb  ":!cargo build<cr>")
(nnoremap :<leader>cbr ":!cargo build --release<cr>")
(nnoremap :<leader>ct  ":!cargo test<cr>")
(nnoremap :<leader>cr  ":!cargo run<cr>")
(nnoremap :<leader>crr ":!cargo run --release<cr>")
(nnoremap :<leader>ca  ":!cargo add ")
(nnoremap :<leader>cf  ":!cargo fmt<cr>")

; Edit vimr configuration file
(nnoremap :<Leader>ve :e $MYVIMRC<CR>)
;Reload vimr configuration file
(nnoremap :<Leader>vr :source $MYVIMRC<CR>)
(nnoremap :<leader>sw ":mksession! .quicksave.vim<cr>")
(nnoremap :<leader>sr ":source .quicksave.vim<cr>")

(nnoremaps :<leader>q ":Copen<cr>")

(nnoremaps :<leader>mc  ":Make! clean<cr>")
(nnoremaps :<leader>mb  ":Make! build<cr>")
(nnoremaps :<leader>mbr ":Make! build --release<cr>")
(nnoremaps :<leader>mt  ":Make! test<cr>")
(nnoremaps :<leader>mr  ":Make! run<cr>")
(nnoremaps :<leader>mrr ":Make! run --release<cr>")

