return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "BufReadPost",
    opts = {
        keywords = {
            TODO = { icon = "󱈸", color = "warning" },
            DONE = { icon = " ", color = "info", alt = { "OK", "DONE" } },
            -- sign is an optional, any boolean/string can be used (e.g. a text or an icon)
            -- if not provided, will use the default (exclamation icon)
            FIX = { icon = " ", color = "error" },
            HACK = { icon = " ", color = "warning" },
            WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
            PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
            NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
            TEST = { icon = "⏲ ", color = "test", alt = { "TESTING" } },
            PASS = { icon = "⏲ ", color = "success", alt = { "PASSED" } },
            FAIL = { icon = "⏲ ", color = "error", alt = { "FAILED" } },
        },

        colors = {
            error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
            warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
            info = { "DiagnosticInfo", "#2563EB" },
            hint = { "DiagnosticHint", "#10B981" },
            default = { "Identifier", "#7C3AED" },
            test = { "Identifier", "#FF00FF" },
            success = { "Added", "#00FF00" },
        },
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        -- TODO: This is todo-comments
        -- DONE: This is done
        -- FIX: FIX
        -- HACK: HACK
        -- WARN: warning
        -- PERF: PERF
        -- NOTE: This is a note
        -- TEST: Test
        -- PASS: Test passed
        -- FAILED: Test failed
    },
}
