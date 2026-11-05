return {
  {
    "folke/snacks.nvim",
    opts = {
      lazygit = {
        configure = false,
      },
      picker = {
        sources = {
          explorer = {
            layout = {
              preset = "sidebar",
              preview = false, -- hidden by default
            },
          },
        },
        layouts = {
          sidebar = {
            layout = {
              position = "right",
              width = 70,
              border = "none",
            },
          },
        },
      },
    },
  },
}
