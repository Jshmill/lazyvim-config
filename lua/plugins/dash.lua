return {
    "nvimdev/dashboard-nvim",
    lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
    opts = function()
local logo = [[
                 ▄▄▄▄▄▄▄▄▄
              ▄██▀▀▀▀▀▀▀▀▀██▄
            ▄█▀    ▄▄▄▄▄    ▀█▄
           ██    ▄▀▀▀▀▀▀▀▄    ██
          ██    ▐▄▄▄▄▄▄▄▄▄▌    ██
          ██      █  █  █      ██
          ██      █  █  █      ██
          ██      █  █  █      ██
          ██      █  █  █      ██
           ██    ▄▄▄▄▄▄▄▄▄    ██
            ▀█▄  ▀▀▀▀▀▀▀▀▀  ▄█▀
              ▀██▄▄▄▄▄▄▄▄▄██▀
                 ▀▀▀▀▀▀▀▀▀

██╗   ██╗███████╗██████╗  █████╗  ██████╗██████╗  ██████╗ ███████╗███████╗
██║   ██║██╔════╝██╔══██╗██╔══██╗██╔════╝██╔══██╗██╔═══██╗██╔════╝██╔════╝
██║   ██║█████╗  ██████╔╝███████║██║     ██████╔╝██║   ██║███████╗███████╗
╚██╗ ██╔╝██╔══╝  ██╔══██╗██╔══██║██║     ██╔══██╗██║   ██║╚════██║╚════██║
 ╚████╔╝ ███████╗██║  ██║██║  ██║╚██████╗██║  ██║╚██████╔╝███████║███████║
  ╚═══╝  ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚══════╝

]]

        logo = string.rep("\n", 1) .. logo .. "\n\n"

        local opts = {
            theme = "doom",
            hide = {
                -- this is taken care of by lualine
                -- enabling this messes up the actual laststatus setting after loading a file
                statusline = false,
            },
            config = {
                header = vim.split(logo, "\n"),
        -- stylua: ignore
        center = {
        {
        action = function()
            vim.cmd("cd ~/Applications/")
            LazyVim.pick("projects")()
        end,
        desc = "Workspace",
        icon = "󱂬 ",
        key = "p",
        },
        { action = 'lua LazyVim.pick()()',            desc = " Find File",        icon = "󰈞 ", key = "f" },
        { action = "ene | startinsert",               desc = " New Buffer",       icon = "󰝒 ", key = "n" },
        { action = 'lua LazyVim.pick("oldfiles")()',  desc = " Recent Files",     icon = "󰋚 ", key = "r" },
        { action = 'lua LazyVim.pick("live_grep")()', desc = " Search Code",      icon = "󰱼 ", key = "g" },
        { action = 'lua LazyVim.pick.config_files()()', desc = " Dotfiles",       icon = "󱁻 ", key = "c" },
        { action = 'lua require("persistence").load()', desc = " Resume Session", icon = "󰁯 ", key = "s" },
        { action = "Lazy",                            desc = " Plugin Manager",   icon = "󰒲 ", key = "l" },
        { action = function() vim.cmd("qa") end,      desc = " Shutdown",         icon = "󰗼 ", key = "q" },
        },
                footer = function()
                    local stats = require("lazy").stats()
                    local ms = math.floor(stats.startuptime * 100 + 0.5) / 100

                    local date = os.date(" %A, %B %d")

                    return {
                        date,
                        "",
                        string.format("⚡ %d/%d plugins loaded in %.2fms", stats.loaded, stats.count, ms),
                    }
                end,
            },
        }

        for _, button in ipairs(opts.config.center) do
            button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
            button.key_format = "  %s"
        end

        -- open dashboard after closing lazy
        if vim.o.filetype == "lazy" then
            vim.api.nvim_create_autocmd("WinClosed", {
                pattern = tostring(vim.api.nvim_get_current_win()),
                once = true,
                callback = function()
                    vim.schedule(function()
                        vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
                    end)
                end,
            })
        end

        return opts
    end,
}
