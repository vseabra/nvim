local wk = require("which-key")

wk.register({
  s = {
    name = "search",
    f = { "<cmd>Telescope find_files<cr>", "search file by name" },
    t = { "<cmd>Telescope live_grep<cr>", "search file by text" },
  },
  l = {
    name = "lsp",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "peform code action" },
    d = { "<cmd>lua vim.diagnostic.open_float()<cr>", "show diagnostics" },
    i = { "<cmd>LspInfo<cr>", "show lsp info" },
    f = { "<cmd>lua vim.lsp.buf.format()<cr>", "format document" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "rename symbol" },
  },
  t = {
    name = "toggles",
    t = { "<cmd>lua require('trouble').toggle()<cr>", "trouble" },
    b = { "<cmd>GitBlameToggle<cr>", "git blame" },
  },
  r = { "<cmd>lua require('ranger-nvim').open(true)<cr>", "ranger" },
  c = { "<cmd>Bwipeout!<cr>", "close buffer" },
  e = { "<cmd>NvimTreeToggle<cr>", "toggle nvimtree" },
}, { prefix = "<leader>" })
