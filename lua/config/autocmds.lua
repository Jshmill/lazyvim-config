-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.api.nvim_create_autocmd("FileType", {
    pattern = "sql",
    callback = function()
        vim.schedule(function()
            vim.opt_local.foldmethod = "indent"
            vim.opt_local.foldexpr = ""
        end)
    end,
})


vim.api.nvim_create_autocmd("Syntax", {
  pattern = "sql",
  callback = function()
    vim.cmd([[
      syntax match Comment "--.*$"
      syntax keyword @keyword.directive GO BEGIN END containedin=ALLBUT,Comment
      syntax keyword @keyword.conditional IF ELSE THEN EXISTS RETURN containedin=ALLBUT,Comment
      syntax keyword @error RAISERROR containedin=ALLBUT,Comment
      syntax keyword @function TRANSACTION INTO containedin=ALLBUT,Comment

      " highlight SqlBlock guifg=#89b4fa gui=bold
    ]])
  end,
})

