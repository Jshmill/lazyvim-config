return {
  -- Project management
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        detection_methods = { "pattern" },
        patterns = { ".git", "package.json", "pyproject.toml" },
      })
    end,
  },

  -- Telescope + Projects
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "ahmedkhalf/project.nvim" },
    keys = {
      { "<leader>p", "<cmd>Telescope projects<cr>", desc = "Switch Project" },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("projects")

      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")

      telescope.setup({
        extensions = {
          projects = {
            on_project_select = function(prompt_bufnr)
              local selection = action_state.get_selected_entry()
              actions.close(prompt_bufnr)
              if selection and selection.path then
                vim.cmd("cd " .. selection.path)
                if package.loaded["neo-tree"] then
                  vim.cmd("Neotree reveal")
                end
              end
            end,
          },
        },
      })
    end,
  },
}
