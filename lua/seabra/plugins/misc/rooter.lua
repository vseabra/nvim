return {
	"wsdjeg/rooter.nvim",
	config = function()
		require("rooter").setup({
			root_patterns = { "Cargo.toml", "package.json", "go.mod", ".git/" },
			outermost = false,
			enable_cache = true,
			project_non_root = "", -- this can be '', 'home' or 'current'
			enable_logger = false, -- enable runtime log via logger.nvim
			command = "cd",
		})
	end,
}
