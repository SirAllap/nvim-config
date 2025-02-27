-- lua/plugins/coding.lua
return {
  {
    "danymat/neogen",
    keys = {
      {
        "<leader>cc",
        function() require("neogen").generate({}) end,
        desc = "Generate Documentation with Neogen",
      },
    },
    opts = {
      snippet_engine = "luasnip",
    },
  },
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    keys = {
      {
        "<leader>r",
        function() require("refactoring").select_refactor() end,
        mode = "v",
        noremap = true,
        silent = true,
        desc = "Refactor code",
      },
    },
    opts = {},
  },
  {
    "echasnovski/mini.bracketed",
    event = "BufReadPost",
    config = function()
      require("mini.bracketed").setup({
        file = { suffix = "" },
        window = { suffix = "" },
        quickfix = { suffix = "" },
        yank = { suffix = "" },
        treesitter = { suffix = "n" },
      })
    end,
  },
  {
    "monaqa/dial.nvim",
    keys = {
      {
        "<C-a>",
        function() return require("dial.map").inc_normal() end,
        expr = true,
        desc = "Increment value",
      },
      {
        "<C-x>",
        function() return require("dial.map").dec_normal() end,
        expr = true,
        desc = "Decrement value",
      },
    },
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group({
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
          augend.constant.alias.bool,
          augend.semver.alias.semver,
          augend.constant.new({ elements = { "let", "const" } }),
        },
      })
    end,
  },
  {
    "simrat39/symbols-outline.nvim",
    keys = {
      {
        "<leader>cs",
        "<cmd>SymbolsOutline<cr>",
        desc = "Toggle Symbols Outline",
      },
    },
    cmd = "SymbolsOutline",
    opts = {
      position = "right",
    },
  },
}
