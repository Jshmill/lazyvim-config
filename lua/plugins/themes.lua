return {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000,
        config = function()
            require("config.catppuccin")
        end,
    },

    { "rose-pine/neovim", name = "rose-pine" },

    -- Install nord theme
    { "shaunsingh/nord.nvim", name = "nord" },

    -- Install everforest theme
    { "sainnhe/everforest", name = "everforest" },

    { 'https://github.com/vague-theme/vague.nvim', name = "vague" },

    -- Install gruvbox theme
    { "sainnhe/gruvbox-material", name = "gruvbox-material" },

    -- Install gruvbox light
    { "morhetz/gruvbox", name = "gruvbox",
        config = function()
            vim.cmd("set background=light")
        end,
    },

    -- Install tokyonight theme
    { "folke/tokyonight.nvim", name = "tokyonight" },

    -- Install Github light theme
    { "projekt0n/github-nvim-theme", name = "github" },

    -- Install Night Owl theme
    { "oxfist/night-owl.nvim", name = "night-owl"}
}
