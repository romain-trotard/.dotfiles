local util = require 'packer.util'

return require('packer').startup({
    function(use)
        use 'wbthomason/packer.nvim'

        use { "catppuccin/nvim", as = "catppuccin" }

        use { "nvim-telescope/telescope.nvim", requires = { { 'nvim-lua/plenary.nvim' } } }
        use 'BurntSushi/ripgrep'
        use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

        use 'ThePrimeagen/harpoon'

        -- LSP config
        use 'neovim/nvim-lspconfig'
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/nvim-cmp'
        -- use 'marilari88/twoslash-queries.nvim'
        -- For luasnip users
        use 'L3MON4D3/LuaSnip'
        use 'saadparwaiz1/cmp_luasnip'

        -- Easy comments
        use 'numToStr/Comment.nvim'

        -- Treesitter
        use("nvim-treesitter/nvim-treesitter", {
            run = ":TSUpdate"
        })
        use 'nvim-treesitter/nvim-treesitter-context'

        -- Git
        use 'lewis6991/gitsigns.nvim'
        use 'TimUntersberger/neogit'

    end,
    config = {
        -- Configure the destination folder for snapshot
        snapshot_path = util.join_paths(vim.fn.stdpath('config'), 'snapshot'),
    }
})
