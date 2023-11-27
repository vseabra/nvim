return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "kyazdani42/nvim-web-devicons" },
	opts = {
		sort = {
			sorter = "case_sensitive",
		},
		view = {
			width = 30,
		},
		renderer = {
			group_empty = true,
		},
		filters = {
			dotfiles = true,
		},
	},
}
