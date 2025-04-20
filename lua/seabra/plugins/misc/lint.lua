return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			javascript = {
				"eslint",
			},
			typescript = {
				"eslint",
			},
			javascriptreact = {
				"eslint",
			},
			typescriptreact = {
				"eslint",
			},
			lua = {
				"selene",
			},
			go = {
				"golangcilint",
			},
		}
	end,
}
