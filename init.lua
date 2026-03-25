-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("plugins.transparent").setup() -- Example: set Material theme
vim.g.material_style = "darker"
vim.cmd("colorscheme tokyonight-night")
