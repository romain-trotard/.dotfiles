vim.keymap.set("n", "<leader>gs", vim.cmd.Git);
vim.keymap.set("n", "<leader>gb", function() vim.cmd('Git blame') end);
vim.keymap.set("n", "<leader>gp", function() vim.cmd('Git push') end);

-- Solve merge conflict with fugitive
--  Git merge
vim.keymap.set("n", "gm", "<cmd>Gvdiffsplit!<CR>");
vim.keymap.set("n", "gf", "<cmd>diffget //2<CR>");
vim.keymap.set("n", "gj", "<cmd>diffget //3<CR>");

