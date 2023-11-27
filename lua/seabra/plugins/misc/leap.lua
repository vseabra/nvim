return {"ggandor/leap.nvim", dependencies = {"tpope/vim-repeat"}, config = function ()
  require('leap').add_default_mappings()
  require('leap').opts.safe_labels = {}
  -- overwrite leap keymaps
  vim.keymap.del({'x', 'o'}, 'x')
  vim.keymap.del({'x', 'o'}, 'X')
end }
