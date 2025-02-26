return {
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {
      input = {
        relative = "editor",
        border = "rounded",
        prefer_width = 0.4,
        override = function(conf)
          conf.col = -1
          conf.row = 0
          return conf
        end,
      },
      select = {
        backend = { "telescope", "builtin" },
        trim_prompt = true,
        builtin = {
          border = "rounded",
          relative = "editor",
        },
      },
    },
  },
}
