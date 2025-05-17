return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    local header = require("seabra.header")

    -- Set header
    dashboard.section.header.val = header.header.val
    dashboard.section.header.opts.hl = header.header.opts.hl

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "󰃅   New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "󰙅   Find file", ":Telescope find_files <CR>"),
      dashboard.button("r", "   Recent", ":Telescope oldfiles<CR>"),
      dashboard.button("c", "   Config", ":e $HOME/.config/nvim/init.lua<CR>"),
      dashboard.button("q", "   Quit NVIM", ":qa<CR>"),

    }

    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])
  end,
}
