return {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000,
        config = function()
            require("config.catppuccin")
        end,
    },

    { "rose-pine/neovim", name = "rose-pine",
        config = function()
            require("config.rose-pine")
        end,
    },

    { "shaunsingh/nord.nvim", name = "nord",
        config = function()
            require("config.nord")
        end,
    },

    {
        "ember-theme/nvim",
        name = "ember",
        priority = 1000,
        config = function()
            require("config.embers")
        end,
    },

    -- Install everforest theme
    {
      'sainnhe/everforest',
      lazy = false,
      priority = 1000,
      config = function()
        vim.g.everforest_background = "soft"
        vim.g.everforest_enable_italic = true
        vim.cmd.colorscheme('everforest')
      end
    },


    { 'https://github.com/vague-theme/vague.nvim', name = "vague" },

    -- Install gruvbox theme
    { "sainnhe/gruvbox-material", name = "gruvbox-material" },

    -- Install gruvbox light
    { "morhetz/gruvbox", name = "gruvbox" },

    -- Install tokyonight theme
    { "folke/tokyonight.nvim", name = "tokyonight" },

    -- Install Github light theme
    { "projekt0n/github-nvim-theme", name = "github" },

    -- Install Night Owl theme
    { "oxfist/night-owl.nvim", name = "night-owl"}
}
