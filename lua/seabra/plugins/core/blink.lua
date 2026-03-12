---@module 'blink.cmp'
return {
	"saghen/blink.cmp",
	---@type blink.cmp.Config
	dependencies = {
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
	},
	version = "*",
	config = function(_, opts)
		require("blink.cmp").setup(opts)
	end,
	opts = {
		keymap = {
			preset = "none",
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide" },
			["<C-CR>"] = { "hide", "fallback" },
			["<CR>"] = { "accept", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },
			["<C-k>"] = { "select_prev", "fallback" },
			["<PageDown>"] = { "scroll_documentation_down" },
			["<PageUp>"] = { "scroll_documentation_up" },
      ["<Tab>"] = {
        "snippet_forward",
        function() -- sidekick next edit suggestion
          return require("sidekick").nes_jump_or_apply()
        end,
        function() -- if you are using Neovim's native inline completions
          return vim.lsp.inline_completion.get()
        end,
        "fallback",
      },
			["<S-Tab>"] = { "snippet_backward", "fallback" },

		},
		completion = {
			list = {
				selection = {
					preselect = false,
					auto_insert = false,
				},
			},
			accept = {
				auto_brackets = { enabled = true },
			},
			documentation = { auto_show = true },
			ghost_text = { enabled = false },
			menu = {
				draw = {
					columns = {
						{ "kind_icon" },
						{ "label", "label_description", gap = 1 },
						{ "source_name" },
					},
					components = {
						source_name = {
							text = function(ctx)
								local map = {
									lsp = "[lsp]",
									buffer = "[buffer]",
									path = "[path]",
									snippets = "[snippet]",
								}
								return map[ctx.source_id] or ("[" .. ctx.source_name .. "]") 
							end,
						},
					},
				},
			},
		},
		snippets = { preset = "luasnip" },
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		appearance = {
			kind_icons = {
				Text = "",
				Method = "m",
				Function = "",
				Constructor = "",
				Field = "",
				Variable = "",
				Class = "",
				Interface = "󰡄",
				Module = "",
				Property = "",
				Unit = "⌂",
				Value = "",
				Enum = "",
				Keyword = "󰌆",
				Snippet = "",
				Color = "",
				File = "",
				Reference = "",
				Folder = "",
				EnumMember = "",
				Constant = "📡",
				Struct = "",
				Event = "",
				Operator = "",
				TypeParameter = "",
			},
		},
	},
}
