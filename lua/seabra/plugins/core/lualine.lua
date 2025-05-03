local colors = require("seabra.colors")

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
	opts = {
		options = {
			icons_enabled = true,
			globalstatus = true,
			theme = "auto",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = {
				statusline = {},
				winbar = {},
			},
			ignore_focus = {},
			always_divide_middle = true,
			refresh = {
				statusline = 300,
				tabline = 1000,
				winbar = 1000,
			},
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = {
				"branch",
				"diff",
				{ "diagnostics", symbols = { error = " ", warn = " ", info = " ", hint = " " } },
				"filename",
			},
			lualine_c = {},
			lualine_x = { "filetype", { "fileformat", symbols = { unix = "LF", mac = "LF(macOS)", dos = "CRLF" } } },
			lualine_y = {
				-- {
				-- 	"tabs",
				-- 	mode = 0,
				-- 	show_modified_status = false,
				-- 	section_separators = { left = "", right = "" },
				-- 	tabs_color = {
				-- 		-- Same values as the general color option can be used here.
				-- 		active = {
				-- 			bg = colors.everforest.hard_background.dark.green,
				-- 			fg = colors.everforest.hard_background.dark.bg1,
				-- 			gui = "bold",
				-- 		},
				-- 		inactive = {
				-- 			fg = colors.everforest.hard_background.dark.green,
				-- 			bg = colors.everforest.hard_background.dark.bg1,
				-- 		},
				-- 	},
				-- },
				"progress",
			},
			lualine_z = { "location" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {},
	},
}
