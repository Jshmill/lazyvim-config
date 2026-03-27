-- plugins/icons.lua
return {
    {
        "nvim-tree/nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup({
                default = true, -- show default icons for unknown filetypes
            })
        end,
    },
}
