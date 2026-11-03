-- Per-category color overrides. Keys are ember's `theme.syn` categories:
--   keyword func string type constant number method property comment
--   doc_comment operator preproc builtin variable variable_use variable_builtin
-- Values: hex string, or a palette accent name (coral orange gold olive sage steel rose mauve).
-- Leave a category out to keep ember's default.
local categories = {
    keyword = "coral",
    func    = "sage",
    string  = "olive",
    type    = "gold",
    comment = "#706c61",
    operator = "steel",
    ['@variable.parameter'] = "rose",
}

require("ember").setup({
    variant = "ember", -- "ember" | "ember-soft" | "ember-light" | "ember-lighter"
    on_highlights = function(highlights, theme)
        if next(categories) == nil then return end
        local syn = vim.deepcopy(theme.syn)
        for cat, color in pairs(categories) do
            syn[cat] = theme.syn[color] or color -- accent name -> hex
        end
        -- Rebuild groups from the modified categories.
        local rebuilt = require("ember.highlights").get(vim.tbl_extend("force", theme, { syn = syn }))
        for group, hl in pairs(rebuilt) do
            highlights[group] = hl
        end
    end,
})

vim.cmd("colorscheme ember")
