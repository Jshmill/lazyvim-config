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
      "Avoid coloring within Comments and Strings"
      syntax match Comment "--.*$"
      syntax match String /"\_.\{-}"\|'\_.\{-}'/

      "Coloring"
      syntax match @variable "@[A-Za-z_][A-Za-z0-9_]*" containedin=ALLBUT,Comment,String
      syntax keyword @tag TOP DEFAULT PRIMARY KEY containedin=ALLBUT,Comment,String
      syntax keyword @keyword.conditional GO BEGIN END ON OFF containedin=ALLBUT,Comment,String
      syntax keyword @label INSERTED UPDATED DELETED containedin=ALLBUT,Comment,String
      syntax keyword @keyword.conditional IF ELSE THEN EXISTS RETURN CASE WHEN containedin=ALLBUT,Comment,String
      syntax keyword @error RAISERROR containedin=ALLBUT,Comment,String
      syntax keyword @function TRANSACTION INTO IDENTITY_INSERT containedin=ALLBUT,Comment,String
      syntax keyword @number NULL containedin=ALLBUT,Comment,String
      syntax keyword TYPE SYSNAME containedin=ALLBUT,Comment,String
      syntax match @property "#[A-Za-z_][A-Za-z0-9_]*" containedin=ALLBUT,Comment,String

      " Schema-qualified object
      syntax match @tag "\<\(dbo\|sys\)\ze\." containedin=ALLBUT,Comment,String
      syntax match @property "\%(\<dbo\>\|\<sys\>\)\.\zs[A-Za-z_][A-Za-z0-9_]*" containedin=ALLBUT,Comment,String

      " Table.column
      syntax match @property "\<[A-Za-z_][A-Za-z0-9_]*\ze\.[A-Za-z_][A-Za-z0-9_]*" containedin=ALLBUT,Comment,String
      syntax match @variable "\.\zs[A-Za-z_][A-Za-z0-9_]*" containedin=ALLBUT,Comment,String

    ]])
  end,
})
