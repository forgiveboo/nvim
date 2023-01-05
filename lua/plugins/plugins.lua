vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'sainnhe/gruvbox-material'

	-- lsp
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-cmdline'
	use "rafamadriz/friendly-snippets"
	use 'onsails/lspkind.nvim'
	use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
	}
	use ({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})
	use 'saadparwaiz1/cmp_luasnip'
	use 'nvim-lua/plenary.nvim'
	use 'jose-elias-alvarez/null-ls.nvim'
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'

	-- find
	use 'nvim-telescope/telescope.nvim'
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	
	-- treesitter
	use 'nvim-treesitter/nvim-treesitter'
	use 'JoosepAlviste/nvim-ts-context-commentstring'

	-- show
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
	}
	use 'nvim-lualine/lualine.nvim'
	use 'akinsho/bufferline.nvim'
	use {
    'goolord/alpha-nvim',
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    end
	}
	use {
		"akinsho/toggleterm.nvim", 
		tag = '*', 
		config = function()
		require("toggleterm").setup()
	end}
	use 'RRethy/vim-illuminate'
	use "lukas-reineke/indent-blankline.nvim"

	-- git
	use 'lewis6991/gitsigns.nvim'

	--code
	use 'numToStr/Comment.nvim'
	use "SmiteshP/nvim-navic"
	use 'mfussenegger/nvim-dap'
	use 'rcarriga/nvim-dap-ui'

end)
