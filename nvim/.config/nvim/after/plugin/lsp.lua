local lsp = require('lsp-zero').preset({})

-- lsp.ensure_installed({
--     'rust_analyzer',
--     'tsserver',
--     'gopls',
--     'astro',
--     'svelte',
-- })

lsp.on_attach(function(client, bufnr)
  local bufopts = { remap=false, buffer=bufnr }

  vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', {buffer = true})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>dj', vim.diagnostic.goto_next, bufopts)
  vim.keymap.set('n', '<space>dk', vim.diagnostic.goto_prev, bufopts)
  vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", bufopts)
end)

lsp.setup()

