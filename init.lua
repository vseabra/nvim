--Remap space as leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("seabra.options")
require("seabra.lazy")
require("lazy").setup({ spec = { { import = "seabra.plugins.core" }, { import = "seabra.plugins.misc" } } })

require("seabra.colorscheme")
require("seabra.highlights")
require("seabra.whichkey")
