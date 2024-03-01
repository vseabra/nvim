local wk = require("which-key")

wk.register({
  s = {
    name = "search",
    f = { "<cmd>Telescope find_files<cr>", "search file by name" },
    t = { "<cmd>Telescope live_grep<cr>", "search file by text" },
    o = { "<cmd>Telescope buffers<cr>", "open buffers" },
    m = { "<cmd>Easypick make_targets<cr>", "search make target" },
    n = { "<cmd>Easypick npm_scripts<cr>", "search npm command" },
    c = { "<cmd>Easypick cargo_commands<cr>", "search cargo command" },
  },
  l = {
    name = "lsp",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "peform code action" },
    d = { "<cmd>lua vim.diagnostic.open_float()<cr>", "show diagnostics" },
    i = { "<cmd>LspInfo<cr>", "show lsp info" },
    f = { "<cmd>lua require('conform').format()<cr>", "format document" },
    F = { "<cmd>lua vim.lsp.buf.format()<cr>", "format document(lsp)" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "rename symbol" },
  },
  t = {
    name = "toggles",
    t = { "<cmd>lua require('trouble').toggle()<cr>", "trouble" },
    b = { "<cmd>GitBlameToggle<cr>", "git blame" },
    d = { "<cmd>DBUIToggle<cr>", "database UI" }
  },
  d = {
    name = "debugger",
    t = { "<cmd>DapToggleBreakpoint<cr>", "toggle breakpoint" },
    s = { "<cmd>DapContinue<cr>", "start/continue" },
    x = { "<cmd>DapTerminate<cr>", "terminate" },
    u = { "<cmd>lua require('dapui').toggle()<cr>", "toggle dapUI" },
    r = { "<cmd>lua require('dapui').open({reset = true})<cr>", "reset ui" }
  },
  r = { "<cmd>lua require'lir.float'.toggle()<cr>", "lir" },
  c = { "<cmd>Bwipeout!<cr>", "close buffer" },
}, { prefix = "<leader>" })
