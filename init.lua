vim.env.PATH = "/Users/joshua.miller/.nvm/versions/node/v22.23.1/bin:" .. vim.env.PATH
--
-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.keymaps")
require("config.options")
-- icons are handled via plugins/icons.lua now
-- SETS A TRANSPARENT THEME
require("config.transparent").setup() -- Example: set Material theme

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
vim.cmd("colorscheme rose-pine-moon")
vim.opt.foldmethod = "indent"

local lint = require("lint")

lint.linters_by_ft = {
    sql = { "sqlfluff" },
}

-- Prevent nvim-lint from overriding project-specific dialects
lint.linters.sqlfluff.args = { "lint", "--format=json", "--dialect=tsql", "-" }

-- Trigger linting automatically
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    callback = function()
        lint.try_lint()
    end,
})

vim.opt.fixeol = true
