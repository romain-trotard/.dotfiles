vim.keymap.set("n", "<leader>gs", vim.cmd.Git);

-- Solve merge conflict with fugitive
vim.keymap.set("n", "gf", "<cmd>diffget //2<CR>");
vim.keymap.set("n", "gj", "<cmd>diffget //3<CR>");

