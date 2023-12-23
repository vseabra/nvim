local vim = vim
-- set conceallevel to 1 for *.norg files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.norg",
  command = "setlocal conceallevel=1",
})

-- set textwidth to 100 for *.norg files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.norg",
  command = "setlocal wrap",
})

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", {}),
  desc = "Hightlight selection on yank",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 170 })
  end,
})

-- Set scrolloff to 0 for terminal buffers
vim.api.nvim_create_autocmd("FileType", {
  pattern = "terminal",
  command = "setlocal scrolloff=0",
})

-- attach lsp signature on lsp attach
vim.api.nvim_create_autocmd({ "LspAttach" }, {
  callback = function()
    require("lsp_signature").setup({
      bind = false,
      handler_opts = {
        border = "none"
      },
    })
  end,
})
