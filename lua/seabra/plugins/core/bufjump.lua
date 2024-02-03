return {
	"kwkarlwang/bufjump.nvim",
	config = function()
		require("bufjump").setup({
			forward = "<Tab>",
			backward = "<BS>",
			on_success = nil,
		})
	end,
}
