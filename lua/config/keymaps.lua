-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jk", "<ESC>")

vim.keymap.set("n", "<Leader>j", "i<CR><Esc>k$", { desc = "Split line at cursor" })

vim.keymap.set("n", "<leader>yp", function()
    local path = vim.fn.expand("%:.")

    vim.fn.setreg("+", path)

    Snacks.notify(
        "󰆏 " .. path,
        {
            title = "Copied"
        }
    )
end, { desc = "Copy relative file path" })

vim.keymap.set("n", "<leader>yl", function()
    local result = string.format(
        "%s:%d",
        vim.fn.expand("%:."),
        vim.fn.line(".")
    )

    vim.fn.setreg("+", result)

    Snacks.notify(
        "󰆏 " .. result,
        {
            title = "Copied"
        }
    )
end, { desc = "Copy file path and line number" })

-- Move Buffers Left or Right
vim.keymap.set("n", "<leader>bH", "<Cmd>BufferLineMovePrev<CR>")
vim.keymap.set("n", "<leader>bL", "<Cmd>BufferLineMoveNext<CR>")

-- Insert new lines
vim.keymap.set("n", "<Enter>", "o<Esc>", { desc = "New Line"})
vim.keymap.set("n", "<S-Enter>", "O<Esc>", { desc = "New Line Above"})

-- vim.keymap.set("n", "<leader>P", "<Cmd>!sqlfluff fix %<CR><Cmd>retab<CR>", {desc = "Format TSQL using sqlfluff"})
vim.keymap.set("n", "<leader>P", function()
  vim.cmd("write")
  vim.cmd("!sqlfluff fix %")
  vim.cmd("edit!")
  vim.cmd("retab")
end, {
  desc = "Format TSQL using sqlfluff",
})

-- For normal mode search
vim.keymap.set('n', '/', '/\\v', { silent = false })
vim.keymap.set('n', '?', '?\\v', { silent = false })

-- For command-line substitution
vim.keymap.set('c', '%s/', '%s/\\v', { silent = false })
vim.keymap.set('c', "'<,'>s/", "'<,'>s/\\v", { silent = false })


-- Add keymaps to increase or decrease the size of the current window
vim.keymap.set("n", "<leader>wl", "<cmd>vertical resize +10<CR>", {
  desc = "Increase window width",
})

vim.keymap.set("n", "<leader>wh", "<cmd>vertical resize -10<CR>", {
  desc = "Increase window width",
})
