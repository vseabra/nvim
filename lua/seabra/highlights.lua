local colors = require("seabra.colors")
local everforest = colors.everforest.hard_background

local Highlights = {
	-- TELESCOPE
	TelescopeBorder = { fg = everforest.dark.bg0 },
	TelescopePreviewBorder = {
		fg = everforest.dark.bg0,
		bg = everforest.dark.bg_dim,
	},
	TelescopeResultsTitle = {
		bold = true,
		fg = everforest.dark.bg_dim,
		bg = everforest.dark.bg_dim,
	},
	TelescopeResultsBorder = {
		fg = everforest.dark.bg0,
		bg = everforest.dark.bg_dim,
	},
	TelescopePreviewTitle = {
		bold = true,
		fg = everforest.dark.bg_dim,
		bg = everforest.dark.yellow,
	},
	TelescopePromptTitle = {
		bold = true,
		fg = everforest.dark.bg_dim,
		bg = everforest.dark.green,
	},
	TelescopePromptBorder = {
		fg = everforest.dark.bg0,
		bg = everforest.dark.bg2,
	},
	TelescopePromptNormal = {
		bold = true,
		bg = everforest.dark.bg2,
	},
	TelescopeResultsNormal = {
		bg = everforest.dark.bg_dim,
	},
	TelescopePreviewNormal = {
		bg = everforest.dark.bg_dim,
	},
	TelescopePreviewDirectory = { fg = everforest.dark.statusline3, bold = true },
	TelescopePreviewDate = { bg = everforest.dark.bg_0 },
	TelescopePreviewSize = { bg = everforest.dark.bg_0 },
	TelescopeSelection = { bold = false, fg = everforest.dark.bg0, bg = everforest.dark.fg },
	TelescopeMatching = { bold = true },
}

for hl, col in pairs(Highlights) do
	vim.api.nvim_set_hl(0, hl, col)
end
