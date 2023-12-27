local colors = require("seabra.colors")

local Highlights = {
	TelescopeBorder = { fg = colors.everforest.hard_background.dark.bg0 },
	TelescopePreviewBorder = {
		fg = colors.everforest.hard_background.dark.bg0,
		bg = colors.everforest.hard_background.dark.bg_dim,
	},
	TelescopeResultsTitle = {
		bold = true,
		fg = colors.everforest.hard_background.dark.bg_dim,
		bg = colors.everforest.hard_background.dark.bg_dim,
	},
	TelescopeResultsBorder = {
		fg = colors.everforest.hard_background.dark.bg0,
		bg = colors.everforest.hard_background.dark.bg_dim,
	},
	TelescopePreviewTitle = {
		bold = true,
		fg = colors.everforest.hard_background.dark.bg_dim,
		bg = colors.everforest.hard_background.dark.yellow,
	},
	TelescopePromptTitle = {
		bold = true,
		fg = colors.everforest.hard_background.dark.bg_dim,
		bg = colors.everforest.hard_background.dark.green,
	},
	TelescopePromptBorder = {
		fg = colors.everforest.hard_background.dark.bg0,
		bg = colors.everforest.hard_background.dark.bg2,
	},
	TelescopePromptNormal = {
		bold = true,
		bg = colors.everforest.hard_background.dark.bg2,
	},
	TelescopeResultsNormal = {
		bg = colors.everforest.hard_background.dark.bg_dim,
	},
  TelescopePreviewNormal = {
		bg = colors.everforest.hard_background.dark.bg_dim,
	},
  TelescopeSelection = { bold = true, fg = colors.everforest.hard_background.dark.bg0, bg = colors.everforest.hard_background.dark.fg },
  TelescopeMatching = { bold = true, fg = colors.everforest.hard_background.dark.red },

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

