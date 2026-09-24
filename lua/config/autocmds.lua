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


-- vim.api.nvim_create_autocmd("Syntax", {
--   pattern = "sql",
--   callback = function()
--     vim.cmd([[
--       " Comments
--       syntax match SqlComment "--.*$"
--
--       " Structure / control flow
--       syntax keyword SqlControl
--             \ BEGIN END
--             \ IF ELSE
--             \ EXISTS RETURN
--             \ containedin=ALLBUT,SqlComment
--
--       " DML
--       syntax keyword SqlDml
--             \ SELECT INSERT UPDATE DELETE
--             \ MERGE
--             \ FROM WHERE INTO
--             \ containedin=ALLBUT,SqlComment
--
--       " Transaction handling
--       syntax keyword SqlTransaction
--             \ TRANSACTION COMMIT ROLLBACK
--             \ containedin=ALLBUT,SqlComment
--
--       " Trigger-specific
--       syntax keyword SqlTrigger
--             \ TRIGGER GO
--             \ DELETED INSERTED
--             \ containedin=ALLBUT,SqlComment
--
--       " Functions
--       syntax keyword SqlFunction
--             \ GETDATE USER_NAME HOST_NAME
--             \ CONVERT
--             \ containedin=ALLBUT,SqlComment
--
--       " Error handling
--       syntax keyword SqlError
--             \ RAISERROR
--             \ containedin=ALLBUT,SqlComment
--
--       " Types
--       syntax keyword SqlType
--             \ VARCHAR NVARCHAR CHAR NCHAR
--             \ INT BIGINT SMALLINT TINYINT
--             \ BIT DATETIME DATE DECIMAL
--             \ containedin=ALLBUT,SqlComment
--     ]])
--
--     local cp = require("catppuccin.palettes").get_palette()
--
--     vim.api.nvim_set_hl(0, "SqlControl", {
--       fg = cp.lavender,
--       bold = true,
--     })
--
--     vim.api.nvim_set_hl(0, "SqlDml", {
--       fg = cp.blue,
--       bold = true,
--     })
--
--     vim.api.nvim_set_hl(0, "SqlTransaction", {
--       fg = cp.flamingo,
--       bold = true,
--     })
--
--     vim.api.nvim_set_hl(0, "SqlTrigger", {
--       fg = cp.mauve,
--       bold = true,
--     })
--
--     vim.api.nvim_set_hl(0, "SqlFunction", {
--       fg = cp.peach,
--     })
--
--     vim.api.nvim_set_hl(0, "SqlError", {
--       fg = cp.red,
--       bold = true,
--     })
--
--     vim.api.nvim_set_hl(0, "SqlType", {
--       fg = cp.yellow,
--     })
--
--     vim.api.nvim_set_hl(0, "SqlComment", {
--       fg = cp.overlay1,
--       italic = true,
--     })
--   end,
-- })
