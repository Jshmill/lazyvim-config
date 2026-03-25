local M = {}

function M.setup()
    local function make_transparent()
        local groups = {
            "Normal",
            "NormalNC",
            "SignColumn",
            "VertSplit",
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
            local ok, hl = pcall(vim.api.nvim_get_hl_by_name, group, true)
            local fg = (ok and hl.fg) and hl.fg or 0xFFFFFF
            vim.api.nvim_set_hl(0, group, {
                fg = fg,
                bg = "NONE",
            })
        end

        -- Optional: other highlights
        local ok, func_hl = pcall(vim.api.nvim_get_hl_by_name, "Function", true)
        local func_fg = (ok and func_hl.fg) or 0x5feded
        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = func_fg, bg = "NONE", bold = true, italic = true })
        vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "LineNr", { fg = 0xd3d3d3, bg = "NONE" })
        vim.api.nvim_set_hl(0, "LineNrAbove", { fg = 0xd3d3d3 })
        vim.api.nvim_set_hl(0, "LineNrBelow", { fg = 0xd3d3d3, bg = "NONE" })
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
