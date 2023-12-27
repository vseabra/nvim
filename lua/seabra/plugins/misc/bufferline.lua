return {
	"akinsho/bufferline.nvim",
	dependencies = { "kyazdani42/nvim-web-devicons" },
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			highlights = {
				diagnostic_selected = { italic = false },
				hint_selected = { italic = false },
				pick_selected = { italic = false },
				pick_visible = { italic = false },
				pick = { italic = false },
				buffer_selected = {
					bold = true,
					italic = false,
					fg = require("seabra.colors").everforest.hard_background.dark.bg0,
					bg = require("seabra.colors").everforest.hard_background.dark.green,
				},
				numbers_selected = {
					bold = true,
					italic = false,
					fg = require("seabra.colors").everforest.hard_background.dark.bg0,
					bg = require("seabra.colors").everforest.hard_background.dark.green,
				},
			},
			options = {
				mode = "buffers", -- set to "tabs" to only show tabpages instead
				style_preset = { bufferline.style_preset.no_italic, bufferline.style_preset.minimal },
				themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
				numbers = "buffer_id",
				close_command = "bdelete! %d", -- can be a string | function, | false see "Mouse actions"
				right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
				left_mouse_command = "buffer %d", -- can be a string | function, | false see "Mouse actions"
				middle_mouse_command = nil, -- can be a string | function, | false see "Mouse actions"
				indicator = {
					icon = "▎", -- this should be omitted if indicator style is not 'icon'
					style = "icon",
				},
				buffer_close_icon = "󰅖",
				modified_icon = "●",
				close_icon = "",
				left_trunc_marker = "",
				right_trunc_marker = "",
				--- name_formatter can be used to change the buffer's label in the bufferline.
				--- Please note some names can/will break the
				--- bufferline so use this at your discretion knowing that it has
				--- some limitations that will *NOT* be fixed.
				max_name_length = 18,
				max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
				truncate_names = true, -- whether or not tab names should be truncated
				tab_size = 20,
				diagnostics = "nvim_lsp",
				diagnostics_update_in_insert = false,
				-- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
				show_buffer_icons = false,
				show_buffer_close_icons = false,
				show_close_icon = false,
				show_tab_indicators = false,
				show_duplicate_prefix = false,
				persist_buffer_sort = true,
				move_wraps_at_ends = false,
				separator_style = "thin",
				enforce_regular_tabs = true,
				always_show_bufferline = true,
				offsets = {
					{
						filetype = "sfm",
						text = "EXPLORER",
						highlight = "Directory",
						separator = true, -- use a "true" to enable the default, or set your own character
					},
				},

				hover = {
					enabled = true,
					delay = 200,
					reveal = { "close" },
				},
			},
		})
	end,
}
