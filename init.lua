--Remap space as leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local gdproject = io.open(vim.fn.getcwd()..'/project.godot', 'r')
if gdproject then
    io.close(gdproject)
    vim.fn.serverstart './godothost'
end

require("seabra.options")
require("seabra.lazy")
require("lazy").setup({ spec = { { import = "seabra.plugins.core" }, { import = "seabra.plugins.misc" } } })

require("seabra.colorscheme")
require("seabra.highlights")
require("seabra.whichkey")
