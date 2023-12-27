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
  TelescopeSelection = { bold = false, fg = everforest.dark.bg0, bg = colors.everforest.hard_background.dark.fg },
  TelescopeMatching = { bold = true },
  -- LIR
  LirFloatNormal = {bg = everforest.dark.bg_dim, fg = colors.everforest.hard_background.dark.fg},
  LirFloatCurdirWindowNormal = { bold = true, bg = everforest.dark.bg2 },
  LirFloatCurdirWindowDirName = { bold = true, fg = everforest.dark.green },
  LirFloatCursorLine = { bold = false, fg = everforest.dark.bg0, bg = colors.everforest.hard_background.dark.fg },

	-- TelescopeMatching = { fg = colors.flamingo },
	-- TelescopeSelection = { fg = colors.text, bg = colors.surface0, bold = true },

	-- TelescopePromptPrefix = { bg = colors.surface0 },
	-- TelescopeResultsNormal = { bg = colors.mantle },
	-- TelescopePreviewNormal = { bg = colors.mantle },
	-- TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
	-- TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
	-- TelescopePreviewBorder = { bg = colors.mantle, fg = colors.mantle },
	-- TelescopePromptTitle = { bg = colors.pink, fg = colors.mantle },
	-- TelescopeResultsTitle = { fg = colors.mantle },
	-- TelescopePreviewTitle = { bg = colors.green, fg = colors.mantle },
}

for hl, col in pairs(Highlights) do
	vim.api.nvim_set_hl(0, hl, col)
end

