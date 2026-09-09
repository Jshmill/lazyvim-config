return {
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        opts = function()
            local keyword = vim.api.nvim_get_hl(0, {
                name = "Keyword",
            })

            local white = vim.api.nvim_get_hl(0, {
                name = "LineNr",
            })

            local func = vim.api.nvim_get_hl(0, {
                name = "Function",
            })

            local warn = vim.api.nvim_get_hl(0, {
                name = "Warnings",
            })

            local err = vim.api.nvim_get_hl(0, {
                name = "Error",
            })
        return {
            options = {
                mode = "buffers",
                separator_style = { "", "" },
                always_show_bufferline = true,
                show_buffer_icons = true,
                show_buffer_close_icons = false,
                show_close_icon = false,
                color_icons = true,
                show_tab_indicators = false,

                max_name_length = 999,
                tab_size = 16,
                padding = 1,

                modified_icon = "●",
                -- Shows the directory context if the filename is init.lua or duplicated
                name_formatter = function(buf)
                    if buf.name:match("init.lua") then
                        return vim.fn.fnamemodify(buf.path, ":p:h:t") .. "/init.lua"
                    end
                    return buf.name
                end,
                diagnostics = "nvim_lsp",
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                -- diagnostics_indicator = function(diagnostics_dict)
                    local s = " "
                    for e, n in pairs(diagnostics_dict) do
                        local sym = e == "error" and " " or (e == "warning" and " " or "")
                        s = s .. n .. sym
                    end
                    return s
                end,
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "File Explorer",
                        highlight = "Directory",
                        text_align = "center",
                    },
                },
            },
            highlights = {
                fill = {
                    bg = "NONE",
                },
                background = {
                    fg = "NONE",
                    bg = "NONE",
                },
                buffer_selected = {
                    fg = func.fg,
                    bg = "NONE",
                    bold = true,
                },

                buffer_visible = {
                    fg = white.fg,
                    bg = "NONE",
                },

                indicator_selected = {
                    fg = "NONE",
                    bg = "NONE",
                },
                modified = {
                    bg = "NONE",
                },
                modified_visible = {
                    bg = "NONE",
                },
                modified_selected = {
                    bg = "NONE",
                },
                separator = {
                    fg = "NONE",
                    bg = "NONE",
                },
                separator_selected = {
                    fg = "NONE",
                    bg = "NONE",
                },
                separator_visible = {
                    fg = "NONE",
                    bg = "NONE",
                },

                warning_diagnostic = {
                    fg = warn.fg,
                    bg = "NONE",
                },

                warning = {
                    fg = white.fg,
                    bg = "NONE",
                },

                error_diagnostic = {
                    fg = err.fg,
                    bg = "NONE",
                },

                error = {
                    fg = white.fg,
                    bg = "NONE",
                },

                -- diagnostic = {
                --     fg = white.fg,
                --     bg = "NONE",
                -- },
                --
                -- info_diagnostic_visible = {
                --     fg = keyword.fg,
                --     bg = "NONE",
                -- },
                --
                -- hint_diagnostic_visible = {
                --     fg = keyword.fg,
                --     bg = "NONE",
                -- },
                --
                -- error_visible = {
                --     fg = keyword.fg,
                --     bg = "NONE",
                -- },
                --
                -- warning_visible = {
                --     fg = keyword.fg,
                --     bg = "NONE",
                -- },
                --
                -- info_visible = {
                --     fg = keyword.fg,
                --     bg = "NONE",
                -- },
                --
                -- hint_visible = {
                --     fg = keyword.fg,
                --     bg = "NONE",
                -- },
            },
        }
        end,
    },
}
