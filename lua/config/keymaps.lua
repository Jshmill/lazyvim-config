-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jk", "<ESC>")

-- Open Telescope projects with Space+p
vim.keymap.set("n", "<leader>p", "<cmd>Telescope projects<cr>", { desc = "Switch Project" })

vim.keymap.set("n", "<leader>xth", "<cmd>TOhtml<CR>", { desc = "Export to HTML" })
