-- Ruby LSP (ruby-lsp) + rubocop linting/formatting

return {
    {
        "mason/mason.nvim",
        opts = function(_, opts)
            opts.ensure_installed = opts.ensure_installed or {}
            vim.list_extend(opts.ensure_installed, { "ruby-lsp", "rubocop" })
            return opts
        end,
    },
    {
        "mfussenegger/nvim-lint",
        opts = function(_, opts)
            opts.linters_by_ft = opts.linters_by_ft or {}
            opts.linters_by_ft.ruby = vim.list_extend(opts.linters_by_ft.ruby or {}, { "rubocop" })
            return opts
        end,
    },
    {
        "stevearc/conform.nvim",
        opts = function(_, opts)
            opts.formatters_by_ft = opts.formatters_by_ft or {}
            opts.formatters_by_ft.ruby = opts.formatters_by_ft.ruby or { "rubocop" }
            return opts
        end,
    },
}
