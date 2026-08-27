-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jk", "<ESC>")

vim.keymap.set("n", "<Leader>j", "i<CR><Esc>k$", { desc = "Split line at cursor" })

vim.keymap.set("n", "<leader>yp", function()
    vim.fn.setreg("+", vim.fn.expand("%:."))
    print("Copied relative path: " .. vim.fn.expand("%"))
end, { desc = "Copy relative file path" })
