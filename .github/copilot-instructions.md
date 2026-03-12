# Neovim Config — Copilot Instructions

## Linting

Lua files are linted with **selene**:
```sh
selene --config selene.toml <file.lua>
selene --config selene.toml lua/seabra/plugins/misc/conform.lua
```

`selene.toml` sets `std = "lua51+vim"` and `mixed_table = "allow"`. `vim.toml` marks all `vim.*` globals as `any = true`.

## Architecture

```
init.lua                        # Entry point: sets <Space> as leader, loads options,
                                # bootstraps lazy.nvim, then colorscheme/highlights/whichkey.
                                # Plugin loading is skipped entirely when vim.g.vscode is set.
lua/seabra/
  options.lua                   # All vim.opt settings
  lazy.lua                      # lazy.nvim bootstrap (clones if missing)
  whichkey.lua                  # All <leader> key mappings via which-key
  colorscheme.lua / highlights.lua / colors.lua
  plugins/
    core/                       # Foundational plugins: telescope, mason+lspconfig,
                                # nvim-cmp, fugitive, lualine, which-key, sleuth, substitute
    misc/                       # All other plugins, one file each
after/plugin/
  lspconfig.lua                 # LSP server configs (loaded after plugins)
  keymaps.lua                   # Non-leader keymaps
  autocmds.lua                  # Autocommands
```

**Plugin loading order**: `init.lua` → `lazy.lua` (bootstrap) → `lazy.setup()` imports `plugins/core` then `plugins/misc` → `after/plugin/` files run last.

## Key Conventions

**Plugin file format** — every file in `plugins/core/` and `plugins/misc/` must return a lazy.nvim spec table:
```lua
return {
  "author/plugin-name",
  config = function()
    require("plugin").setup({ ... })
  end,
}
```

**LSP configuration** uses Neovim's native API (`vim.lsp.config` + `vim.lsp.enable`), not lspconfig's `require("lspconfig").server.setup()`. New servers go in `after/plugin/lspconfig.lua`:
```lua
lspconfig("server_name", { settings = { ... } })
vim.lsp.enable("server_name")
```
Active servers: `lua_ls`, `svelte`, `jsonls`, `ts_ls`, `gopls`, `rust_analyzer`, `clangd`, `typos_lsp`, `copilot`.

**Indentation**: tabs (not spaces), `tabstop = 2`, `shiftwidth = 2`, `expandtab = false`.

**Keymap pattern** in `after/plugin/keymaps.lua`:
```lua
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("n", "<key>", "<cmd>...<CR>", opts)
```

**Autocmds** all go in `after/plugin/autocmds.lua`. Linters (nvim-lint) run automatically on `InsertLeave` and `BufWritePost`.

**VSCode compatibility**: `init.lua` wraps all plugin loading in `if not vim.g.vscode`. The `after/` directory is also removed from runtimepath when in VSCode.

## Formatters and Linters

| Language | Formatter (conform) | Linter (nvim-lint) |
|---|---|---|
| Lua | stylua | selene |
| JavaScript/TypeScript | prettier | eslint |
| Go | goimports-reviser, goimports, gofmt | golangcilint |
| Rust | rustfmt | — |
| Python | isort, black | — |
| YAML | prettier | — |

Format: `<leader>lf` (conform) or `<leader>lF` (LSP format).

## Key Bindings Reference

| Key | Action |
|---|---|
| `<leader>sf` | Telescope find files |
| `<leader>st` | Telescope live grep |
| `<leader>so` | Open buffers |
| `<leader>ss` | LSP workspace symbols |
| `<leader>lf` | Format (conform) |
| `<leader>la` | Code action |
| `<leader>lr` | Rename symbol |
| `<leader>ld` | Show diagnostics float |
| `<leader>d*` | DAP debugger (Go: delve, JS: pwa-node, Rust/C: codelldb) |
| `<leader>tt` | Trouble diagnostics |
| `<leader>tc` | Copilot chat (Sidekick) |
| `<S-l>` / `<S-h>` | Next/prev buffer |
| `1`–`9` | Jump to tab N |
| `<C-h/j/k/l>` | Window/tmux pane navigation |
| `s` / `ss` | Substitute operator / line (substitute.nvim) |
| `gl` | Diagnostic float |
| `[d` / `]d` | Prev/next diagnostic |
