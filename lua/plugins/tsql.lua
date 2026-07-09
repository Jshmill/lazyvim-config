-- TSQL / MSSQL buffer setup
-- Disables sqlls (from lang.sql extra) in favor of dadbod.
-- Sets vim's built-in sqlanywhere syntax for TSQL keyword coverage.

return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                sqlls = { enabled = false },
            },
            setup = {
                sqlls = function()
                    return true
                end,
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        init = function()
            vim.filetype.add({
                extension = {
                    tsql = "sql",
                    ddl = "sql",
                    dml = "sql",
                },
            })

            vim.g.sql_type_default = "sqlanywhere"

            vim.api.nvim_create_autocmd({ "FileType", "BufEnter" }, {
                pattern = "sql",
                callback = function(args)
                    vim.schedule(function()
                        if vim.api.nvim_buf_is_valid(args.buf) then
                            pcall(vim.treesitter.stop, args.buf)
                            vim.api.nvim_set_hl(0, "@error.sql", { link = "Normal" })
                            vim.bo[args.buf].syntax = "sql"
                        end
                    end)
                end,
            })
        end,
    },
    {
        "mfussenegger/nvim-lint",
        opts = function(_, opts)
            opts.linters_by_ft = opts.linters_by_ft or {}
            opts.linters_by_ft.sql = vim.list_extend(opts.linters_by_ft.sql or {}, { "sqlfluff" })
            opts.linters = opts.linters or {}
            opts.linters.sqlfluff = {
                args = { "lint", "--format", "json", "--dialect", "tsql", "-" },
            }
            return opts
        end,
    },
    {
        "mason/mason.nvim",
        opts = function(_, opts)
            opts.ensure_installed = opts.ensure_installed or {}
            vim.list_extend(opts.ensure_installed, { "sqlfluff" })
            return opts
        end,
    },
}
