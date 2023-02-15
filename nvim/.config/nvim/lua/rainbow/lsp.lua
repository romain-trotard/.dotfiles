vim.filetype.add({
    extension = {
        astro = "astro",
    }
})

local on_attach_config = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
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
end


local capabilities = require('cmp_nvim_lsp').default_capabilities()

require'lspconfig'.tsserver.setup{
    -- By default it's { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    capabilities = capabilities,
    on_attach = function(client, bufnr) 
        on_attach_config(client, bufnr)
        require("twoslash-queries").attach(client, bufnr)
    end,
}

require'lspconfig'.flow.setup{
    capabilities = capabilities,
    on_attach = on_attach_config,
}


require'lspconfig'.gopls.setup{
    capabilities = capabilities,
    on_attach = on_attach_config,
}

require'lspconfig'.astro.setup{
    capabilities = capabilities,
    on_attach = on_attach_config,
}

require'lspconfig'.svelte.setup{
    capabilities = capabilities,
    on_attach = on_attach_config,
}


--Enable (broadcasting) snippet capability for completion
local jsonCapabilities = vim.lsp.protocol.make_client_capabilities()
jsonCapabilities.textDocument.completion.completionItem.snippetSupport = true
require'lspconfig'.jsonls.setup{
    capabilities = jsonCapabilities,
    on_attach = on_attach_config,
}

vim.opt.completeopt={"menu", "menuone", "noselect"} -- setting vim value

-- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'npm', keyword_length = 4 },
      -- { name = 'vsnip' }, -- For vsnip users.
      { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

