
return {
    "nvim-treesitter/nvim-treesitter",
    opts = {
        ensure_installed = {
            "lua",
            "python",
            "javascript",
            "typescript",
            "html",
            "css",
            "json",
            "zsh",
            "tsql",
        },
        highlight = {
            enable = true,
        },
    },
}

