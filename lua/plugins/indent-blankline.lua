return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "BufReadPost",
    opts = {
      indent = { char = "▏" },
      scope = {
        show_start = false,
        show_end = false,
        include = {
          node_type = { ["*"] = { "*" } },
        },
      },
    },
  },
}
