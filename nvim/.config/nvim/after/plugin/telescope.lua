require'telescope'.setup{ 
    defaults = { 
        file_ignore_patterns = { "node_modules" },
        layout_config = {
            width = 0.95,
            height = 0.95,
        }
    } 
}

require'telescope'.load_extension('fzf')
require'telescope'.load_extension('harpoon')
require'telescope'.load_extension('live_grep_args')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fx', require('telescope').extensions.live_grep_args.live_grep_args, {})
vim.keymap.set('v', '<leader>fs', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.keymap.set('n', '<leader>sh', builtin.search_history, {})
vim.keymap.set('n', '<leader>qh', builtin.quickfixhistory, {})

vim.keymap.set('n', '<leader>gss', builtin.git_status, {})
vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})


-- Harpoon shortcut
vim.keymap.set('n', '<leader>hm', require('harpoon.ui').toggle_quick_menu)
vim.keymap.set('n', '<leader>ha', require('harpoon.mark').add_file)

for i = 1, 6 do
    vim.keymap.set('n', string.format('<leader>h%s', i), function() require('harpoon.ui').nav_file(i) end)
end
