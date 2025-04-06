local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lspconfig = require("lspconfig")

lspconfig.gdscript.setup({})

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using
				-- (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {
					"vim",
					"require",
				},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

lspconfig.gopls.setup(capabilities)
lspconfig.rust_analyzer.setup({})
lspconfig.svelte.setup({})
-- lspconfig.tailwindcss.setup({})

lspconfig.jsonls.setup({
	capabilities = capabilities,
})

-- lspconfig.tsserver.setup(capabilities)
lspconfig.ts_ls.setup(capabilities)

lspconfig.gdscript.setup(capabilities)

lspconfig.rust_analyzer.setup({
	completion = {
		callable = { snippets = "fill_arguments" },
		fullFunctionSignatures = { enable = true },
	},
	procMacro = { enable = true },
	check = {
		command = "clippy",
	},
	cargo = {
		features = "all",
	},
})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "gl", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)
vim.keymap.set("n", "K", vim.lsp.buf.hover)

-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
--   underline = true,
--   virtual_text = false,
--   signs = true,
--   update_in_insert = false,
-- })
