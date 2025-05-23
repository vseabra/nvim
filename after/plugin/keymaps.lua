local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap


-- Normal --
-- Better window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", opts)
keymap("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", opts)
keymap("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", opts)
keymap("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", opts)

keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

keymap("n", "q", "<nop>", opts)
keymap("n", "qq", "q", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)

-- Tab navigation with numbers
keymap("n", "1", "1gt", opts)
keymap("n", "2", "2gt", opts)
keymap("n", "3", "3gt", opts)
keymap("n", "4", "4gt", opts)
keymap("n", "5", "5gt", opts)
keymap("n", "6", "6gt", opts)
keymap("n", "7", "7gt", opts)
keymap("n", "8", "8gt", opts)
keymap("n", "9", "9gt", opts)

-- Visual --
-- Stay in indent mode
keymap("x", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("x", "<A-j>", ":m .+1<CR>==", opts)
keymap("x", "<A-k>", ":m .-2<CR>==", opts)
keymap("x", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- inserts ctrl + \ + n before C-hjkl
--
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Go to definition
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

-- Go to implementation
keymap("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)

-- Go to references
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

vim.keymap.set("n", "s", require('substitute').operator, { noremap = true })
vim.keymap.set("n", "ss", require('substitute').line, { noremap = true })
vim.keymap.set("x", "s", require('substitute').visual, { noremap = true })


-- zoom in and out of windows
vim.cmd([[
command! ZI wincmd _ | wincmd |
command! ZO wincmd =
]])
