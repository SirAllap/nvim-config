return {
  {
    "folke/tokyonight.nvim",
    priority = 1000, -- Ensure this loads first
    init = function()
      -- Set colorscheme early
      vim.cmd.colorscheme("tokyonight")
    end,
    config = function()
      require("tokyonight").setup({
        style = "storm", -- storm, night, moon
        transparent = true,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          sidebars = "transparent",
          floats = "transparent",
        },
        on_highlights = function(hl, c)
          hl.TelescopeBorder = { fg = c.bg_highlight, bg = c.bg }
          hl.TelescopePromptBorder = { fg = c.orange, bg = c.bg }
        end,
      })
    end
  }
}
