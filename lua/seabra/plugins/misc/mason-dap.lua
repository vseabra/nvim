return {
	"jay-babu/mason-nvim-dap.nvim",
	opts = {
		handlers = {}, -- This line is essential to making automatic installation work
		automatic_installation = {
			-- These will be configured by separate plugins.
			exclude = {
				"delve",
				"pwa-node",
			},
		},
		-- DAP servers: Mason will be invoked to install these if necessary.
		ensure_installed = {
			-- "bash",
			-- "codelldb",
			-- "php",
			-- "python",
		},
	},
	dependencies = {
		"mfussenegger/nvim-dap",
		"williamboman/mason.nvim",
	},
}
