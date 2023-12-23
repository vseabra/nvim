return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- lua
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.selene,
        -- ts / js
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.formatting.prettier,
        -- go
        null_ls.builtins.diagnostics.golangci_lint,
        null_ls.builtins.formatting.goimports_reviser,

        --json
        null_ls.builtins.diagnostics.jsonlint,
      },
    })
  end,
}
