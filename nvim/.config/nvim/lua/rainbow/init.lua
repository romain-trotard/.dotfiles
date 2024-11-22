require('rainbow.packer');

-- I always want `:E` to execute `Explore` not matter plugin that I am using
vim.api.nvim_create_user_command("E", "Explore", {});

