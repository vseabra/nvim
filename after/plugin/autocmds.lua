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
vim.api.nvim_create_autocmd({ "TermOpen" }, {
  pattern = { "*" },
  callback = function()
    vim.opt_local.scrolloff = 0
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.cmd('normal! G')
  end,
})

-- https://www.reddit.com/r/neovim/comments/16hiz32/help_for_disappearing_statusline/
-- vim.api.nvim_create_autocmd({ "ModeChanged" }, {
--   pattern = { "*" },
--   callback = function()
--     vim.schedule(function()
--       vim.cmd("redraw")
--     end)
--   end,
-- })

-- attach lsp signature on lsp attach
vim.api.nvim_create_autocmd({ "LspAttach" }, {
  callback = function()
    require("lsp_signature").setup({
      bind = false,
      handler_opts = {
        border = "none",
      },
    })
  end,
})

-- run linters on save and when leaving insert mode
vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost" }, {
    callback = function()
        local lint_status, lint = pcall(require, "lint")
        if lint_status then
            lint.try_lint()
        end
    end,
})


-- create server pipe
local pipepath = vim.fn.stdpath("cache") .. "/server.pipe"
if not vim.loop.fs_stat(pipepath) then
  vim.fn.serverstart(pipepath)
end
