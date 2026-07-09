return {
    "numToStr/FTerm.nvim",
    config = function()
        local fterm = require("FTerm")
        fterm.setup({
            border = "rounded",
            dimensions = {
                height = 0.8,
                width = 0.8,
            },
        })

        vim.keymap.set("n", "<leader>t", function()
            fterm.toggle()
        end, { desc = "Toggle FTerm" })

        vim.keymap.set("t", "jk", "<C-\\><C-n>", { desc = "Terminal normal mode" })
    end,
}
