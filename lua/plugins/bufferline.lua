return {
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        opts = {
            options = {
                mode = "buffers",
                separator_style = "none",
                always_show_bufferline = true,
                show_buffer_icons = true,
                show_buffer_close_icons = true,
                show_close_icon = true,
                color_icons = true,
                show_tab_indicators = false,

                tab_size = 0,
                padding = 0,

                indicator = {},
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
                    bg = "none",
                },
                background = {
                    fg = "#6c7086",
                    bg = "NONE",
                },
                buffer_selected = {
                    fg = "#ffffff",
                    bg = "none",
                    bold = true,
                },
                buffer_visible = {
                    fg = "#6c7086",
                    bg = "none",
                },
                indicator_selected = {
                    fg = "none",
                    bg = "none",
                },
                modified = {
                    bg = "none",
                },
                modified_visible = {
                    bg = "none",
                },
                modified_selected = {
                    bg = "none",
                },
                separator = {
                    fg = "none",
                    bg = "none",
                },
                separator_selected = {
                    fg = "none",
                    bg = "none",
                },
                separator_visible = {
                    fg = "none",
                    bg = "none",
                },
            },
        },
    },
}
