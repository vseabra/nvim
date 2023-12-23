local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").lua_ls.setup({
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
        },
        diagnostics = {
          globals = {
            "vim",
            "require",
          },
        },
        telemetry = {
          enable = false,
        },
      },
    },
  },
})
require("lspconfig").gopls.setup({})
require("lspconfig").jsonls.setup({
  capabilities = capabilities,
})

require("typescript-tools").setup({
  on_attach = function(client)
    client.server_capabilities.document_formatting = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "gl", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)
vim.keymap.set("n", "K", vim.lsp.buf.hover)

-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
--   underline = true,
--   virtual_text = false,
--   signs = true,
--   update_in_insert = false,
-- })
