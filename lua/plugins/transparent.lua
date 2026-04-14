local M = {}

function M.setup()
    local function make_transparent()
        local groups = {
            "Normal",
            "NormalNC",
            "SignColumn",
            "StatusLine",
            "StatusLineNC",
            "TabLine",
            "TabLineFill",
            "TabLineSel",
            "EndOfBuffer",
            "Folded",
            "NvimTreeNormal",
            "NormalFloat",
            "FloatBorder",
            "Pmenu",
            "PmenuSbar",
            "PmenuThumb",
        }

        for _, group in ipairs(groups) do
            vim.api.nvim_set_hl(0, group, {
                -- fg = 0xFFFFFF,
                bg = "NONE",
            })
        end

        local moremsg = vim.api.nvim_get_hl(0, { name = "MoreMsg" })

        -- Optional: other highlights
        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = moremsg.fg, bg = "NONE", bold = true, italic = true })
        vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "LineNr", { fg = 0xd3d3d3, bg = "NONE" })
        vim.api.nvim_set_hl(0, "LineNrAbove", { fg = 0xd3d3d3 })
        vim.api.nvim_set_hl(0, "LineNrBelow", { fg = 0xd3d3d3, bg = "NONE" })
        vim.api.nvim_set_hl(0, "LspInlayHint", { fg = 0x8E8BA7, bg = "NONE" })
    end

    -- Reapply transparency whenever a new colorscheme is set
    vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = make_transparent,
    })

    -- Run once on startup
    make_transparent()
end

return M
