return {
  "tamago324/lir.nvim",
  config = function()
    local actions = require("lir.actions")
    local clipboard_actions = require("lir.clipboard.actions")

    require("lir").setup({
      show_hidden_files = true,
      ignore = { "node_modules" }, -- { ".DS_Store", "node_modules" } etc.
      devicons = {
        enable = true,
        highlight_dirname = true,
      },
      mappings = {
        ["l"] = actions.edit,
        ["<C-s>"] = actions.split,
        ["<C-v>"] = actions.vsplit,
        ["<C-t>"] = actions.tabedit,

        ["h"] = actions.up,
        ["q"] = actions.quit,

        ["A"] = actions.mkdir,
        ["a"] = actions.newfile,
        ["r"] = actions.rename,
        ["@"] = actions.cd,
        ["Y"] = actions.yank_path,
        ["."] = actions.toggle_show_hidden,
        ["x"] = actions.delete,
        ["y"] = clipboard_actions.copy,
        ["X"] = clipboard_actions.cut,
        ["p"] = clipboard_actions.paste,
      },
      float = {
        winblend = 0,
        win_opts = function()
          return {
            relative = "editor",

            border = "none",
            style = "minimal",
          }
        end,
        curdir_window = {
          enable = true,
          highlight_dirname = true,
        },
      },
      hide_cursor = false,
    })

    -- custom folder icon
    require("nvim-web-devicons").set_icon({
      lir_folder_icon = {
        icon = "",
        color = require("seabra.colors").everforest.hard_background.dark.blue,
        name = "LirFolderNode",
      },
    })
  end,
}
