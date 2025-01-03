require('gitsigns').setup{
    on_attach = function(bufnr) 
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end
        
        -- map('n', '<leader>gb', gs.toggle_current_line_blame)
    end
}
--
-- require('neogit').setup{
--     on_attach = function(bufnr) 
--         local neogit = package.loaded.neogit
--
--         local function map(mode, l, r, opts)
--             opts = opts or {}
--             opts.buffer = bufnr
--             vim.keymap.set(mode, l, r, opts)
--         end
--         
--         map('n', '<leader>gs', neogit.open)
--     end
-- }

