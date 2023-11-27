require "seabra.options"
require "seabra.keymaps"
require "seabra.lazy"
require("lazy").setup({ spec = { {import="seabra.plugins.core" }, {import="seabra.plugins.misc"}} })

require "seabra.colorscheme"
require "seabra.lspconfig"
require "seabra.whichkey"
require "seabra.linters"
