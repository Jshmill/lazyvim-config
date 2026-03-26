-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.keymaps")
require("plugins.transparent").setup() -- Example: set Material theme
vim.g.material_style = "darker"
vim.cmd("colorscheme tokyonight-night")
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.opt_local.conceallevel = 0
    end,
})
