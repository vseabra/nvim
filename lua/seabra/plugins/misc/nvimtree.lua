vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

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
				indent_markers = {
					enable = true,
					icons = {
						corner = "└",
						edge = "│",
						none = "",
						bottom = "─",
					},
				},
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
					padding = "",
					symlink_arrow = " ➛ ",
					show = {
						file = false,
						folder = true,
						folder_arrow = false,
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
							arrow_closed = "│",
							arrow_open = "└",
							default = "● ",
							open = "◌ ",
							empty = "◌",
							empty_open = "◌ ",
							symlink = "",
							symlink_open = "",
						},
						git = {
							unstaged = "",
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
				number= true,
				signcolumn= "no",
				float = {
					enable = true,
					open_win_config = function()
						local screen_w = vim.opt.columns:get()
						local w_h = 60
						local s_h = 30
						local center_x = (screen_w - w_h) / 2
						local center_y = ((vim.opt.lines:get() - s_h) / 5) - vim.opt.cmdheight:get()
						return {
							relative = "editor",
							row = center_y,
							col = center_x,
							width = w_h,
							height = s_h,
							border = "shadow"
						}
					end,
				},
				width = function()
					return math.floor(vim.opt.columns:get() * 5)
				end,
			},
			filters = {
				dotfiles = false,
			},
		},
	},
}
