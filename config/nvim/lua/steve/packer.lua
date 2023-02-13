-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		-- or                            , branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	use({
		'hardliner66/office',
		as = 'office',
		config = function()
			vim.cmd('colorscheme office-dark')
		end
	})

	use('luochen1990/rainbow')

	use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
	use({ 'eraserhd/parinfer-rust', run = '!cargo build --release' })
	use('nvim-treesitter/playground')
	use('theprimeagen/harpoon')
	use('mbbill/undotree')
	use('tpope/vim-fugitive')
	use('tpope/vim-surround')
	use('tpope/vim-commentary')
	use('tpope/vim-dotenv')
	use('tpope/vim-sleuth')
	use('vim-scripts/paredit.vim')

	use('plasticboy/vim-markdown')
	use('ap/vim-buftabline')
	use('jiangmiao/auto-pairs')
	use('cespare/vim-toml')
	use('itchyny/lightline.vim')
	use('arthurxavierx/vim-caser')
	use('Shougo/vinarise.vim')
	use('liuchengxu/vim-which-key')
	use({ 'sakhnik/nvim-gdb', run = "./install.sh" })
	use('lambdalisue/suda.vim')
	use('kuon/rhai.vim')
	use('machakann/vim-swap')
	use('itspriddle/vim-shellcheck')
	use('radgeRayden/vim-scopes')

	use('pseewald/vim-anyfold')
	use('easymotion/vim-easymotion')

	use('vladdoster/remember.nvim')
	use('dijkstracula/vim-plang')

	use('gbrlsnchs/telescope-lsp-handlers.nvim')

	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'saadparwaiz1/cmp_luasnip' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-nvim-lua' },

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },
			{ 'rafamadriz/friendly-snippets' },
		}
	}

	use("folke/zen-mode.nvim")

end)
