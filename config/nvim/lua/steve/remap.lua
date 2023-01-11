vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>i", ":set invnumber invrelativenumber<CR>")

local function vsc_vim(mode, key, vscode_cmd, nvim_cmd)
		local command = nvim_cmd
		if (vim.g.vscode) then
				command = vscode_cmd
		end
		vim.keymap.set(mode, key, ":" .. command .. "<CR>")
end

vsc_vim("n", "<leader>k", "Tabnext",  "bn")
vsc_vim("n", "<leader>j", "Tabprevious", "bp")
vsc_vim("n", "<leader>d", "Tabclose", "bd")
vsc_vim("n", "<leader>w", "Write", "w")

if (not vim.g.vscode) then
	vim.keymap.set("n", ":<leader><leader>k", ":bn!<CR>")
	vim.keymap.set("n", ":<leader><leader>j", ":bp!<CR>")
	vim.keymap.set("n",  ":<leader><leader>d", ":bd!<CR>")
end

vim.keymap.set("n", "<leader>o", "gf<ESC>", {silent = true})

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader><leader>q", ":cq!<CR>", { silent = true })
vim.keymap.set("n", "<leader>co", ":copen<CR>", { silent = true })
vim.keymap.set("n", "<leader>cn", ":cn<cr>")
vim.keymap.set("n", "<leader>cp", ":cp<cr>")
vim.keymap.set("n", "<leader>cc", ":!cargo clean<cr>")
vim.keymap.set("n", "<leader>cb", ":!cargo build<cr>")
vim.keymap.set("n", "<leader>cbr", ":!cargo build --release<cr>")
vim.keymap.set("n", "<leader>ct", ":!cargo test<cr>")
vim.keymap.set("n", "<leader>cr", ":!cargo run<cr>")
vim.keymap.set("n", "<leader>crr", ":!cargo run --release<cr>")
vim.keymap.set("n", "<leader>ca", ":!cargo add ")
vim.keymap.set("n", "<leader>cf", ":!cargo fmt<cr>")
vim.keymap.set("n", "<Leader>ve", ":e $MYVIMRC<CR>")
vim.keymap.set("n", "<Leader>vr", ":source $MYVIMRC<CR>")
vim.keymap.set("n", "<leader>sw", ":mksession! .quicksave.vim<cr>")
vim.keymap.set("n", "<leader>sr", ":source .quicksave.vim<cr>")
vim.keymap.set("n", "<leader>q", ":Copen<cr>", { silent = true })
vim.keymap.set("n", "<leader>mc", ":Make! clean<cr>", { silent = true })
vim.keymap.set("n", "<leader>mb", ":Make! build<cr>", { silent = true })
vim.keymap.set("n", "<leader>mbr", ":Make! build --release<cr>", { silent = true })
vim.keymap.set("n", "<leader>mt", ":Make! test<cr>", { silent = true })
vim.keymap.set("n", "<leader>mr", ":Make! run<cr>", { silent = true })
vim.keymap.set("n", "<leader>mrr", ":Make! run --release<cr>", { silent = true })

