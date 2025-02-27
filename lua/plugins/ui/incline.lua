return {
  {
    "b0o/incline.nvim",
    dependencies = { "scottmckendry/cyberdream.nvim" },
    event = "BufReadPre",
    priority = 1200,
    config = function()
      local colors = require("tokyonight.colors").setup()
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = colors.magenta, guifg = colors.bg_dark },
            InclineNormalNC = { guifg = colors.magenta, guibg = colors.bg },
          },
        },
        window = {
          margin = { vertical = 0, horizontal = 1 },
        },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return {
            { icon, guifg = color },
            { " " },
            { filename },
          }
        end,
      })
    end,
  },
}
