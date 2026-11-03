-- Per-category color overrides. Keys are ember's `theme.syn` categories:
--   keyword func string type constant number method property comment
--   doc_comment operator preproc builtin variable variable_use variable_builtin
-- Values: hex string, or a palette accent name (coral orange gold olive sage steel rose mauve).
-- Leave a category out to keep ember's default.
local categories = {
    statement = "orange",
    sqlstatement = "orange",
    func    = "sage",
    string  = "olive",
    type    = "gold",
    comment = "#706c61",
    operator = "steel",
    conditional = "steel",
}

require("ember").setup({
    variant = "ember",
    on_highlights = function(highlights, theme)
        local syn = vim.deepcopy(theme.syn)
        for cat, color in pairs(categories) do
            if cat ~= "@variable.parameter" then
                syn[cat] = theme.syn[color] or color
            end
        end

        local rebuilt = require("ember.highlights").get(vim.tbl_extend("force", theme, { syn = syn }))
        for group, hl in pairs(rebuilt) do
            highlights[group] = hl
        end

        -- Capture groups aren't ember categories, so set these directly.
        local overrides = {
            ["@variable.parameter"] = { fg = theme.syn.rose },
            Keyword = { fg = theme.syn.orange },
            ['@keyword.conditional'] = { bold = false },
            ['@property'] = { fg = theme.syn.sage},
            ['@tag'] = { fg = theme.syn.orange },
            ['@label'] = { fg = theme.syn.orange },
        }
        for group, hl in pairs(overrides) do
            highlights[group] = vim.tbl_extend("force", highlights[group] or {}, hl)
        end
    end,
})

vim.cmd("colorscheme ember")

vim.cmd("colorscheme ember")
