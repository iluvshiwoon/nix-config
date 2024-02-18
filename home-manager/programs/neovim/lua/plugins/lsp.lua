local lspconfig = require ('lspconfig')

lspconfig.nil_ls.setup{}

lspconfig.pyright.setup{}

lspconfig.bashls.setup{}

lspconfig.clangd.setup{}

lspconfig.lua_ls.setup ({
  })

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

-- local on_attach = function(_, bufnr)
--
--   local bufmap = function(keys, func)
--     vim.keymap.set('n', keys, func, { buffer = bufnr })
--   end
--
--   bufmap('<leader>r', vim.lsp.buf.rename)
--   bufmap('<leader>a', vim.lsp.buf.code_action)
--
--   bufmap('gd', vim.lsp.buf.definition)
--   bufmap('gD', vim.lsp.buf.declaration)
--   bufmap('gI', vim.lsp.buf.implementation)
--   bufmap('<leader>D', vim.lsp.buf.type_definition)
--
--   bufmap('gr', require('telescope.builtin').lsp_references)
--   bufmap('<leader>s', require('telescope.builtin').lsp_document_symbols)
--   bufmap('<leader>S', require('telescope.builtin').lsp_dynamic_workspace_symbols)
--
--   bufmap('K', vim.lsp.buf.hover)
--
--   vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
--     vim.lsp.buf.format()
--   end, {})
-- end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require('neodev').setup({})


