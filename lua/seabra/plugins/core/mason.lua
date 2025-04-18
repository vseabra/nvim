return {
	{ "williamboman/mason.nvim", config = true },
	{ "williamboman/mason-lspconfig.nvim", dependencies = { "neovim/nvim-lspconfig", "williamboman/mason.nvim" } },
	{
		"neovim/nvim-lspconfig",
		config = function()
			local signs = {
				{ name = "DiagnosticSignError", text = "" },
				{ name = "DiagnosticSignWarn", text = "" },
				{ name = "DiagnosticSignHint", text = "" },
				{ name = "DiagnosticSignInfo", text = "" },
			}

			local config = {
				virtual_text = true,
				signs = {
					active = signs,
					text = {
						[vim.diagnostic.severity.ERROR] = "",
						[vim.diagnostic.severity.WARN] = "",
						[vim.diagnostic.severity.HINT] = "",
						[vim.diagnostic.severity.INFO] = "",
					}
				},
				update_in_insert = true,
				underline = false,
				severity_sort = true,
				float = {
					focusable = true,
					style = "minimal",
					border = "none",
					source = "always",
					header = "",
					prefix = function (diagnostic)
						local severity_hl_map = {
							-- TODO: custom hl groups here
							[vim.diagnostic.severity.ERROR] = "Exception",
							[vim.diagnostic.severity.WARN] = "Type",
							[vim.diagnostic.severity.INFO] = "Include",
							[vim.diagnostic.severity.HINT] = "Character",
						}
						return " ", severity_hl_map[diagnostic.severity]
					end
				},
			}

			vim.diagnostic.config(config)

			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = "none",
				style = "minimal",
			})

			vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
				border = "none",
				style = "minimal",
			})
		end,
	},
}
