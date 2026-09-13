require("catppuccin").setup({
    custom_highlights = function(colors)
        return {
            -- Comment = { fg = colors.flamingo },
            TabLineSel = { fg = colors.pink },
            CmpBorder = { fg = colors.surface2 },
            Pmenu = { bg = colors.none },
            MatchParen = { bg = colors.none, fg = colors.red },
            Operator = { bg = colors.none, fg = colors.peach },
            Number = {fg = colors.red},
            Conditional = {fg = colors.pink},
            PreProc = {fg = colors.flamingo},
        }
    end,
})

vim.cmd.colorscheme("catppuccin")
