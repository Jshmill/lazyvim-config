-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.keymaps")
require("config.options")
-- icons are handled via plugins/icons.lua now
-- SETS A TRANSPARENT THEME
require("plugins.transparent").setup() -- Example: set Material theme

vim.opt.termguicolors = true
vim.opt.relativenumber = false
vim.g.material_style = "darker"
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.opt_local.conceallevel = 0
    end,
})

-- NOTE: COLORSCHEME CONTROLLED HERE
vim.cmd("colorscheme rose-pine")
