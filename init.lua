-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.keymaps")
require("config.options")
require("nvim-web-devicons").setup()
-- SETS A TRANSPARENT THEME
require("plugins.transparent").setup() -- Example: set Material theme

vim.g.material_style = "darker"
vim.cmd("colorscheme catppuccin-mocha")
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.opt_local.conceallevel = 0
    end,
})
