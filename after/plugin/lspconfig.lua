local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local lspconfig = vim.lsp.config

--  _
-- | |_   _  __ _
-- | | | | |/ _` |
-- | | |_| | (_| |
-- |_|\__,_|\__,_|

lspconfig("lua_ls", {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = {
					"vim",
					"require",
				},
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
})
vim.lsp.enable("lua_ls")

--                _ _
--  _____   _____| | |_ ___
-- / __\ \ / / _ \ | __/ _ \
-- \__ \\ V /  __/ | ||  __/
-- |___/ \_/ \___|_|\__\___|

lspconfig("svelte", {})
vim.lsp.enable("svelte")

--    _
--   (_)___  ___  _ __
--   | / __|/ _ \| '_ \
--   | \__ \ (_) | | | |
--  _/ |___/\___/|_| |_|
-- |__/

lspconfig("jsonls", {
	capabilities = capabilities,
})
vim.lsp.enable("jsonls")

--  _                                   _       _
-- | |_ _   _ _ __   ___  ___  ___ _ __(_)_ __ | |_
-- | __| | | | '_ \ / _ \/ __|/ __| '__| | '_ \| __|
-- | |_| |_| | |_) |  __/\__ \ (__| |  | | |_) | |_
--  \__|\__, | .__/ \___||___/\___|_|  |_| .__/ \__|
--      |___/|_|                         |_|

lspconfig("ts_ls", capabilities)
vim.lsp.enable("ts_ls")

--   __ _  ___
--  / _` |/ _ \
-- | (_| | (_) |
--  \__, |\___/
--  |___/

lspconfig("gopls", capabilities)
vim.lsp.enable("gopls")

--                 _
--  _ __ _   _ ___| |_
-- | '__| | | / __| __|
-- | |  | |_| \__ \ |_
-- |_|   \__,_|___/\__|

lspconfig("rust_analyzer", {
	settings = {
		completion = {
			callable = { snippets = "fill_arguments" },
			fullFunctionSignatures = { enable = true },
		},
		procMacro = { enable = true },
		check = {
			command = "clippy",
			allFeatures = true,
			extraArgs = {
				"--",
				"--no-deps",
				"-Dclippy::correctness",
				"-Dclippy::complexity",
				"-Wclippy::perf",
				"-Wclippy::pedantic",
			},
		},
		cargo = {
			features = "all",
		},
	},
})
vim.lsp.enable("rust_analyzer")

--  _
-- | |_ _   _ _ __   ___  ___
-- | __| | | | '_ \ / _ \/ __|
-- | |_| |_| | |_) | (_) \__ \
--  \__|\__, | .__/ \___/|___/
--      |___/|_|

lspconfig("typos_lsp", capabilities)
vim.lsp.enable("typos_lsp")

-- -- Global mappings.
-- -- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "gl", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
