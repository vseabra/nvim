local colorscheme = "everforest"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

vim.api.nvim_set_hl(0, "LeapLabelPrimary", { link = "Type" })
vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "VirtualTextInfo" })

-- LirFloatNormal: Use a slightly different background than the main editor
vim.cmd("highlight LirFloatNormal guibg=#4d5960 guifg=FG_COLOR")

-- LirFloatCurdirWindowNormal: Background for the current directory window
vim.cmd("highlight LirFloatCurdirWindowNormal gui=bold guibg=#293136 guifg=FG_COLOR")

-- LirFloatCurdirWindowDirName: Directory name in the current directory window
vim.cmd("highlight LirFloatCurdirWindowDirName guifg=#e67e80")
