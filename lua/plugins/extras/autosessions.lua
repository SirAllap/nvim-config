return {
  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup(
        {
          suppressed_dirs = { '~/', '/mnt/data/code/', '~/Downloads', '/' },
          session_lens = {
            buffertype_to_ignore = {},
            load_on_setup = true,
            theme_conf = { border = true },
            preview = false,
          },
          vim.keymap.set("n", "<leader>ss", require("auto-session.session-lens").search_session, {
            noremap = true,
          }),
        }
      )
    end,
  },
}
