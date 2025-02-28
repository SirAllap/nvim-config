return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
      { "<S-w>", "<Cmd>BufferLinePickClose<CR>", desc = "Close buffer" },
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Pin buffer" },
      { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Close other buffers" },
    },
    opts = {
      options = {
        mode = "buffers",
        numbers = "ordinal",
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        show_buffer_close_icons = false,
        show_close_icon = false,
        separator_style = "none", -- 🔥 Removes the triangles
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            separator = true,
          },
        },
      },
      highlights = {
        fill = { bg = "NONE" }, -- Fully transparent background
        background = { bg = "NONE", fg = "#888888" }, -- Inactive tabs
        buffer_selected = { bg = "NONE", fg = "#ffffff", bold = true }, -- Focused tab
        separator = { fg = "NONE", bg = "NONE" }, -- 🔥 No separators
        separator_selected = { fg = "NONE", bg = "NONE" },
        close_button = { fg = "#ff5555", bg = "NONE" },
        close_button_selected = { fg = "#ff5555", bg = "NONE" },
        modified = { fg = "#50fa7b", bg = "NONE" },
        modified_selected = { fg = "#50fa7b", bg = "NONE" },
        indicator_selected = { fg = "#8be9fd", bg = "NONE" },
      },
    },
  },
}
