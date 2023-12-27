require("seabra.options")
require("seabra.lazy")
require("lazy").setup({ spec = { { import = "seabra.plugins.core" }, { import = "seabra.plugins.misc" } } })

require("seabra.colorscheme")
require("seabra.highlights")
require("seabra.whichkey")
