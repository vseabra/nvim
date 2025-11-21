--Remap space as leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("seabra.options")

if not vim.g.vscode then
	require("seabra.lazy")
	require("lazy").setup({ spec = { { import = "seabra.plugins.core" }, { import = "seabra.plugins.misc" } } })

	require("seabra.colorscheme")
	require("seabra.highlights")
	require("seabra.whichkey")
end

if vim.g.vscode then
  vim.opt.runtimepath:remove(vim.fn.stdpath("config") .. "/after")
end
