return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { { "prettier" } },
				typescript = { { "prettier" } },
				go = { "goimports-reviser", "goimports", "gofmt" },
				yaml = { "prettier" },
			},
		})
	end,
}
