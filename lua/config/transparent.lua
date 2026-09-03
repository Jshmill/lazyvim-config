local M = {}


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

    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "FloatTitle", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "FloatFooter", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = moremsg.fg, bg = "NONE", bold = true, italic = true })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "LineNr", { fg = 0xd3d3d3, bg = "NONE" })
    vim.api.nvim_set_hl(0, "LineNrAbove", { fg = 0xd3d3d3 })
    vim.api.nvim_set_hl(0, "LineNrBelow", { fg = 0xd3d3d3, bg = "NONE" })
    vim.api.nvim_set_hl(0, "LspInlayHint", { fg = 0x8E8BA7, bg = "NONE" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = 0xF6C177, bg = "NONE" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = 0xF6C177, bg = "NONE" })
    vim.defer_fn(function()
        vim.cmd("hi lualine_c_normal guibg=NONE")
        vim.cmd("hi lualine_c_insert guibg=NONE")
        vim.cmd("hi lualine_c_visual guibg=NONE")
        vim.cmd("hi lualine_c_replace guibg=NONE")
        vim.cmd("hi lualine_c_command guibg=NONE")
        vim.cmd("hi lualine_x_5_inactive guibg=NONE")
        vim.cmd("hi lualine_x_5_terminal guibg=NONE")
        vim.cmd("hi lualine_x_5_replace guibg=NONE")
        vim.cmd("hi lualine_x_5_visual guibg=NONE")
        vim.cmd("hi lualine_x_5_command guibg=NONE")
        vim.cmd("hi lualine_x_5_insert guibg=NONE")
        vim.cmd("hi lualine_x_5_normal guibg=NONE")
        vim.cmd("hi lualine_c_diagnostics_warn_normal guibg=NONE")
        vim.cmd("hi lualine_c_diagnostics_warn_insert guibg=NONE")
        vim.cmd("hi lualine_c_diagnostics_warn_visual guibg=NONE")
        vim.cmd("hi lualine_c_diagnostics_warn_replace guibg=NONE")
        vim.cmd("hi lualine_c_diagnostics_warn_command guibg=NONE")
        vim.cmd("hi lualine_c_filetype_MiniIconsGrey_normal guibg=NONE")
        vim.cmd("hi lualine_c_filetype_MiniIconsGrey_insert guibg=NONE")
        vim.cmd("hi lualine_c_filetype_MiniIconsGrey_visual guibg=NONE")
        vim.cmd("hi lualine_c_filetype_MiniIconsGrey_replace guibg=NONE")
        vim.cmd("hi lualine_c_filetype_MiniIconsGrey_command guibg=NONE")
        vim.cmd("hi lualine_c_filetype_MiniIconsRed_normal guibg=NONE")
        vim.cmd("hi lualine_c_filetype_MiniIconsRed_insert guibg=NONE")
        vim.cmd("hi lualine_c_filetype_MiniIconsRed_visual guibg=NONE")
        vim.cmd("hi lualine_c_filetype_MiniIconsRed_replace guibg=NONE")
        vim.cmd("hi lualine_c_filetype_MiniIconsRed_command guibg=NONE")
        vim.cmd("hi lualine_x_2_normal guibg=NONE")
        vim.cmd("hi lualine_x_2_insert guibg=NONE")
        vim.cmd("hi lualine_x_2_visual guibg=NONE")
        vim.cmd("hi lualine_x_2_replace guibg=NONE")
        vim.cmd("hi lualine_x_2_command guibg=NONE")
        vim.cmd("hi lualine_x_2_terminal guibg=NONE")
        vim.cmd("hi lualine_x_2_inactive guibg=NONE")
        vim.cmd("hi lualine_x_3_normal guibg=NONE")
        vim.cmd("hi lualine_x_3_insert guibg=NONE")
        vim.cmd("hi lualine_x_3_visual guibg=NONE")
        vim.cmd("hi lualine_x_3_replace guibg=NONE")
        vim.cmd("hi lualine_x_3_command guibg=NONE")
        vim.cmd("hi lualine_x_3_terminal guibg=NONE")
        vim.cmd("hi lualine_x_3_inactive guibg=NONE")
        vim.cmd("hi lualine_x_4_normal guibg=NONE")
        vim.cmd("hi lualine_x_4_insert guibg=NONE")
        vim.cmd("hi lualine_x_4_visual guibg=NONE")
        vim.cmd("hi lualine_x_4_replace guibg=NONE")
        vim.cmd("hi lualine_x_4_command guibg=NONE")
        vim.cmd("hi lualine_x_4_terminal guibg=NONE")
        vim.cmd("hi lualine_x_4_inactive guibg=NONE")
        vim.cmd("hi lualine_x_diff_added_normal guibg=NONE")
        vim.cmd("hi lualine_x_diff_added_insert guibg=NONE")
        vim.cmd("hi lualine_x_diff_added_visual guibg=NONE")
        vim.cmd("hi lualine_x_diff_added_replace guibg=NONE")
        vim.cmd("hi lualine_x_diff_added_command guibg=NONE")
        vim.cmd("hi lualine_x_diff_added_terminal guibg=NONE")
        vim.cmd("hi lualine_x_diff_added_inactive guibg=NONE")
        vim.cmd("hi lualine_x_diff_modified_normal guibg=NONE")
        vim.cmd("hi lualine_x_diff_modified_insert guibg=NONE")
        vim.cmd("hi lualine_x_diff_modified_visual guibg=NONE")
        vim.cmd("hi lualine_x_diff_modified_replace guibg=NONE")
        vim.cmd("hi lualine_x_diff_modified_command guibg=NONE")
        vim.cmd("hi lualine_x_diff_modified_terminal guibg=NONE")
        vim.cmd("hi lualine_x_diff_modified_inactive guibg=NONE")
        vim.cmd("hi lualine_x_diff_removed_normal guibg=NONE")
        vim.cmd("hi lualine_x_diff_removed_insert guibg=NONE")
        vim.cmd("hi lualine_x_diff_removed_visual guibg=NONE")
        vim.cmd("hi lualine_x_diff_removed_replace guibg=NONE")
        vim.cmd("hi lualine_x_diff_removed_command guibg=NONE")
        vim.cmd("hi lualine_x_diff_removed_terminal guibg=NONE")
        vim.cmd("hi lualine_x_diff_removed_inactive guibg=NONE")
        vim.cmd("hi StatusLineTerm guibg=NONE")
        vim.cmd("hi StatusLineTermNC guibg=NONE")
        vim.cmd("hi StatusLineNC guibg=NONE")
        vim.cmd("hi StatusLine guibg=NONE")
        vim.cmd("hi MiniStatuslineFilename guibg=NONE")
        vim.cmd("hi MiniStatuslineDevinfo guibg=NONE")

    end, 100)
end

function M.refresh()
    make_transparent()
end


function M.setup()

    vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = make_transparent,
    })

    make_transparent()
end

return M
