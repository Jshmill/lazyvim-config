require("catppuccin").setup({
    custom_highlights = function(colors)
        return {
            -- Comment = { fg = colors.flamingo },
            TabLineSel = { fg = colors.pink },
            CmpBorder = { fg = colors.surface2 },
            Pmenu = { bg = colors.none },
            MatchParen = { bg = colors.none, fg = colors.red },
            Operator = { bg = colors.none, fg = colors.peach, italic = true },
            Number = {fg = colors.red},
            Conditional = {fg = colors.pink},
            PreProc = {fg = colors.flamingo},
            ["@variable"] = {italic = true}
        }
    end,
})

vim.cmd.colorscheme("catppuccin")
