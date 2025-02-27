-- lua/plugins/telescope.lua
return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-live-grep-args.nvim",
      "nvim-telescope/telescope-project.nvim",
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.load_extension("project")
      telescope.load_extension("live_grep_args")

      vim.keymap.set("n", "<leader>fp", telescope.extensions.project.project,
        { desc = "Find Projects" })
      vim.keymap.set("n", "<leader>fg", telescope.extensions.live_grep_args.live_grep_args,
        { desc = "Live Grep with Args" })
    end
  },
  {
    "airblade/vim-rooter",
    init = function()
      vim.g.rooter_patterns = { ".git", "package.json", "pyproject.toml" }
    end
  }
}
