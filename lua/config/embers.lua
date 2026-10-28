require("ember").setup({
  styles = {
    comments  = { italic = true },
    keywords  = { bold = true },
    functions = {},
    types     = { bold = true },
  },

  transparent = true,
  transparent_floats = true,

  on_highlights = function(hl, c)
    -- Make floating windows transparent
    hl.NormalFloat = { bg = "NONE" }
    hl.FloatBorder = { bg = "NONE" }

    -- Make Snacks notifications stand out
    hl.SnacksNotifierInfo = { fg = c.green, bold = true }
    hl.SnacksNotifierTitle = { fg = c.green, bold = true }

    -- More subtle comments
    hl.Comment = vim.tbl_extend("force", hl.Comment or {}, {
      italic = true,
      fg = c.overlay,
    })

    -- Brighter function names
    hl.Function = vim.tbl_extend("force", hl.Function or {}, {
      bold = true,
    })

    -- Current line
    hl.CursorLine = { bg = c.surface0 }

    -- Matching parentheses
    hl.MatchParen = {
      fg = c.peach,
      bold = true,
    }
  end,
})
