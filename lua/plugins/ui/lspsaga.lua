-- lua/plugins/ui/lspsaga.lua
return {
  "glepnir/lspsaga.nvim",
  event = "LspAttach",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lspsaga").setup({
      symbol_in_winbar = { enable = false },
      lightbulb = { enable = false },
      outline = { keys = { toggle_or_jump = '<leader>cs' } },
    })
  end,
}

