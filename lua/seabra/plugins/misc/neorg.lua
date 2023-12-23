return {
	"nvim-neorg/neorg",
	build = ":Neorg sync-parsers",
	dependencies = { "nvim-lua/plenary.nvim" },
  event="VeryLazy",
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {}, -- Loads default behaviour
				["core.concealer"] = {}, -- Adds pretty icons to your documents
				["core.journal"] = {
          config = {
            engine = "nvim-cmp",
            journal_name = "journal",
            workspace = "personal"
          }
        },
				["core.completion"] = {
          config = {
            engine = "nvim-cmp",
            name = "neorg"
          }
        }, -- Loads default behaviour
				["core.dirman"] = { -- Manages Neorg workspaces
					config = {
            default_workspace = "notes",
						workspaces = {
							notes = "~/Notes/notes",
							personal = "~/Notes/personal",
							work = "~/Notes/work",
						},
					},
				},
			},
		})
	end,
}
