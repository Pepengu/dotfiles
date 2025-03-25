-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'


    -- Lsp

    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
    use {'neoclide/coc.nvim', branch = 'release'}



	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.6',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use {'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}}

    use "nvim-lua/plenary.nvim" 
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { {"nvim-lua/plenary.nvim"} }
    }

	use {'mbbill/undotree'}


    use {'lervag/vimtex'}

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    use { "catppuccin/nvim", as = "catppuccin" }

    use 'wakatime/vim-wakatime'

    use 'nvimdev/template.nvim'

    use "/home/daniil/plugins/runner.nvim"

    use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

end)



