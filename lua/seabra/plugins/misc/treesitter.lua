return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup{
      ensure_installed = "all",
      version = nil,
      sync_install = false,
      ignore_install = { "" }, -- List of parsers to ignore installing
      highlight = {
        enable = true,         -- false will disable the whole extension
        disable = { "" },      -- list of language that will be disabled
      },
      indent = { enable = true, disable = { "yaml", "python" } },
    }
  end
}

