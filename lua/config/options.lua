-- Options are automatically loaded before lazy.nvim startup
vim.g.have_nerd_font = true
vim.g.autoformat = false
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.shiftwidth = 4 -- Size of an indent
vim.opt.tabstop = 4 -- Number of spaces tabs count for
vim.opt.softtabstop = 4 -- Number of spaces tabs count for while editing
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.autoindent = true      -- Copy indent from current line when starting a new one
vim.opt.smartindent = true  -- Make indenting smart (e.g., adding indents after '{')


vim.opt.swapfile = false       -- Disable creating swap files
vim.opt.backup = false         -- Disable creating backup files
vim.opt.undofile = true        -- Enable persistent undo (saves undo history to a file)

vim.opt.foldcolumn = "1"
vim.opt.fillchars = {
  foldopen = "",   -- Icon for an expanded fold
  foldclose = "",  -- Icon for a collapsed fold
  fold = " ",       -- Fills the background of the fold line
  foldsep = " ",    -- Separator icon for nested folds
}
