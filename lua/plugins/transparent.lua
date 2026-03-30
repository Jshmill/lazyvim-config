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
            "BufferLineFill",
            "BufferLineBackground",
            "BufferLineBackgroundSelected",
            "BufferLineBackgroundVisible",
            "BufferLineTab",
            "BufferLineTabSelected",
            "BufferLineTabVisible",
            "BufferLineIndicator",
            "BufferLineIndicatorSelected",
            "BufferLineIndicatorVisible",
            "BufferLineCloseButton",
            "BufferLineCloseButtonSelected",
            "BufferLineCloseButtonVisible",
            "BufferLineDuplicate",
            "BufferLineDuplicateSelected",
            "BufferLineDuplicateVisible",
            "BufferLineModified",
            "BufferLineModifiedSelected",
            "BufferLineModifiedVisible",
            "BufferLineModifiedVisible",
            "BufferLineModifiedSelected",
            "BufferLineMiniIconsAzure",
            "BufferLineMiniIconsAzureSelected",
            "BufferLineMiniIconsAzureVisible",
            "BufferLineBuffer",
            "BufferLineBufferVisible",
        }

        for _, group in ipairs(groups) do
            vim.api.nvim_set_hl(0, group, {
                -- fg = 0xFFFFFF,
                bg = "NONE",
            })
        end

        -- Optional: other highlights
        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = 0x5feded, bg = "NONE", bold = true, italic = true })
        vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "LineNr", { fg = 0xd3d3d3, bg = "NONE" })
        vim.api.nvim_set_hl(0, "LineNrAbove", { fg = 0xd3d3d3 })
        vim.api.nvim_set_hl(0, "LineNrBelow", { fg = 0xd3d3d3, bg = "NONE" })
        -- vim.api.nvim_set_hl(0, "VertSplit", { fg = "NONE", bg = "NONE" })
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
