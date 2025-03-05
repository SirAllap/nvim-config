return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
      { "<S-w>", "<Cmd>BufferLinePickClose<CR>", desc = "Pick and close buffer" },
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Pin buffer" },
      { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Close other buffers" },
      { "<leader>bc", "<Cmd>bdelete!<CR>", desc = "Close current buffer" }, -- New key mapping
    },
    opts = {
      options = {
        mode = "buffers",
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
        separator_style = "NONE",
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
        fill = { bg = "NONE" },
        background = { bg = "NONE", fg = "#888888" },
        buffer_selected = { bg = "NONE", fg = "#50fa7b", bold = true },
        separator = { fg = "#44475a", bg = "NONE" },
        separator_selected = { fg = "#50fa7b", bg = "NONE" }, -- Consistent with unselected tabs
        close_button = { fg = "#ff5555", bg = "NONE" },
        close_button_selected = { fg = "#ff5555", bg = "NONE" },
        modified = { fg = "#50fa7b", bg = "NONE" },
        modified_selected = { fg = "#50fa7b", bg = "NONE" },
        indicator_selected = { fg = "#50fa7b", bg = "NONE" },
      },
    },
  },
}
