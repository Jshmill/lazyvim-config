return {
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        opts = {
            options = {
                mode = "buffers",
                separator_style = { "", "" },
                always_show_bufferline = true,
                show_buffer_icons = true,
                show_buffer_close_icons = false,
                show_close_icon = false,
                color_icons = true,
                show_tab_indicators = false,

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
                    fg = "#ffffff",
                    bg = "NONE",
                    bold = true,
                },
                buffer_visible = {
                    fg = "#6c7086",
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
            },
        },
    },
}
