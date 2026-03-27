return {
  {
    "nvim-tree/nvim-web-devicons",
    lazy = false,
    opts = {
      default = true, -- show default icons for unknown filetypes
    },
    config = function(_, opts)
      require("nvim-web-devicons").setup(opts)
    end,
  },
}
