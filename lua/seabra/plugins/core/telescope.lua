return {
  "nvim-telescope/telescope.nvim",
  config = function()
    require('telescope').setup {
      defaults = {
        border = true,
      },
    }
  end,
  dependencies = { { "nvim-lua/plenary.nvim" },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' } }
}
