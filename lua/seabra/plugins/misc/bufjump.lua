return {
	"kwkarlwang/bufjump.nvim",
	config = function()
		require("bufjump").setup({
			forward_key = false,
			backward_key = false,
			on_success = nil,
		})

		local opts = { silent = true, noremap = true }
		vim.api.nvim_set_keymap("n", "<BS>", ":lua require('bufjump').backward()<cr>", opts)
		vim.api.nvim_set_keymap("n", "<S-BS>", ":lua require('bufjump').forward()<cr>", opts)
		-- vim.api.nvim_set_keymap("n", "<M-o>", ":lua require('bufjump').backward_same_buf()<cr>", opts)
		-- vim.api.nvim_set_keymap("n", "<M-i>", ":lua require('bufjump').forward_same_buf()<cr>", opts)
	end,
}
