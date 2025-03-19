vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

local HEIGHT_RATIO = 0.7
local WIDTH_RATIO = 0.3

return {
	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			disable_netrw = true,
			hijack_netrw = true,
			respect_buf_cwd = true,
			sync_root_with_cwd = true,
			git = { ignore = false },
			renderer = {
				icons = {
					web_devicons = {
						file = {
							enable = false,
							color = true,
						},
						folder = {
							enable = false,
							color = true,
						},
					},
					git_placement = "after",
					modified_placement = "after",
					diagnostics_placement = "signcolumn",
					bookmarks_placement = "signcolumn",
					padding = " ",
					symlink_arrow = " ➛ ",
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
						modified = true,
						diagnostics = true,
						bookmarks = true,
					},
					glyphs = {
						default = "+",
						symlink = "",
						bookmark = "󰆤",
						modified = "-",
						folder = {
							arrow_closed = "-",
							arrow_open = "+",
							default = "●",
							open = "◌",
							empty = "◌",
							empty_open = "◌",
							symlink = "",
							symlink_open = "",
						},
						git = {
							unstaged = "",
							staged = "✓",
							unmerged = "",
							renamed = "➜",
							untracked = "󱏴",
							deleted = "",
							ignored = "-",
						},
					},
				},
			},
			view = {
				relativenumber = true,
				float = {
					enable = true,
					open_win_config = function()
						local screen_w = vim.opt.columns:get()
						local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
						local window_w = screen_w * WIDTH_RATIO
						local window_h = screen_h * HEIGHT_RATIO
						local window_w_int = math.floor(window_w)
						local window_h_int = math.floor(window_h)
						local center_x = (screen_w - window_w) / 2
						local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
						return {
							border = "rounded",
							relative = "editor",
							row = center_y,
							col = center_x,
							width = window_w_int,
							height = window_h_int,
						}
					end,
				},
				width = function()
					return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
				end,
			},
			filters = {
				dotfiles = false
			},
			-- renderer = {
			--   indent_width = 1,
			-- },
		},
	},
}
