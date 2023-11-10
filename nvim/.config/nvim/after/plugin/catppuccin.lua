vim.g.catppuccin_flavour = "mocha"

require("catppuccin").setup({
    color_overrides = {
        all = {
            base = '#000000'
        }
    }
})

vim.cmd [[colorscheme catppuccin]]

