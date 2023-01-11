vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.whichwrap = "<,>,h,l,[,]"
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wildmenu = true
vim.opt.wildmode = "full"
vim.opt.foldmethod = "indent"
vim.opt.foldenable = true
vim.opt.foldlevelstart = 10
vim.opt.foldnestmax = 10
vim.opt.laststatus = 2
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.backspace = "indent,eol,start"
vim.opt.wrap = false
vim.opt.hlsearch = false
vim.opt.timeoutlen = 2000
vim.opt.updatetime = 300
vim.opt.mouse = ""
vim.opt.swapfile = false
vim.opt.hidden = true
vim.opt.cmdheight = 2
vim.opt.shortmess = "c"
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.shell = "/bin/sh"
vim.opt.compatible = false
vim.opt.syntax = "on"
vim.opt.termguicolors = true

vim.opt.smartindent = true

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
