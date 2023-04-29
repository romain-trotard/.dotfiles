local util = require 'packer.util'

return require('packer').startup({
    function(use)
        use 'wbthomason/packer.nvim'

        use { "catppuccin/nvim", as = "catppuccin" }

        use { "nvim-telescope/telescope.nvim", requires = { { 'nvim-lua/plenary.nvim' } } }
        use 'BurntSushi/ripgrep'
        use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

        use 'ThePrimeagen/harpoon'
        use 'mbbill/undotree'

        use 'dstein64/vim-startuptime'

        -- LSP config
        use {
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v2.x',
            requires = {
                -- LSP Support
                {'neovim/nvim-lspconfig'},
                {
                    'williamboman/mason.nvim',
                    run = function()
                        pcall(vim.cmd, 'MasonUpdate')
                    end,
                },
                {'williamboman/mason-lspconfig.nvim'},

                -- Autocompletion
                {'hrsh7th/nvim-cmp'},
                {'hrsh7th/cmp-buffer'},
                {'hrsh7th/cmp-path'},
                {'saadparwaiz1/cmp_luasnip'},
                {'hrsh7th/cmp-nvim-lsp'},
                {'hrsh7th/cmp-nvim-lua'},

                -- Snippets
                {'L3MON4D3/LuaSnip'},
            }
        }

        -- use 'marilari88/twoslash-queries.nvim'

        -- Easy comments
        use 'numToStr/Comment.nvim'

        -- Treesitter
        use("nvim-treesitter/nvim-treesitter", {
            run = ":TSUpdate"
        })
        use 'nvim-treesitter/nvim-treesitter-context'

        -- Git
        -- use 'lewis6991/gitsigns.nvim'
        -- Remove this later
        use 'tpope/vim-fugitive'

    end,
    config = {
        -- Configure the destination folder for snapshot
        snapshot_path = util.join_paths(vim.fn.stdpath('config'), 'snapshot'),
    }
})
