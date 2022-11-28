require'telescope'.setup{ defaults = { file_ignore_patterns = { "node_modules" } } }
require'telescope'.load_extension('fzf')
require'telescope'.load_extension('harpoon')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Harpoon shortcut
vim.keymap.set('n', '<leader>hm', require('harpoon.ui').toggle_quick_menu)
vim.keymap.set('n', '<leader>ha', require('harpoon.mark').add_file)

for i = 1, 6 do
    vim.keymap.set('n', string.format('<leader>h%s', i), function() require('harpoon.ui').nav_file(i) end)
end
