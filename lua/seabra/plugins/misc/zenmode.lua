return {
	{
		"folke/zen-mode.nvim",
		opts = {
			backdrop = 0.9, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
			width = 210,
			height = 1,
			options = {
				signcolumn = "yes", -- disable signcolumn
				number = true, -- disable number column
				relativenumber = true, -- disable relative numbers
				cursorline = false, -- disable cursorline
				cursorcolumn = false, -- disable cursor column
				foldcolumn = "0", -- disable fold column
				list = false, -- disable whitespace characters
			},
			plugins = {
				-- disable some global vim options (vim.o...)
				-- comment the lines to not apply the options
				options = {
					enabled = true,
					ruler = false, -- disables the ruler text in the cmd line area
					showcmd = false,
					laststatus = 0, -- turn off the statusline in zen mode
				},
			},
		},
	},
}
