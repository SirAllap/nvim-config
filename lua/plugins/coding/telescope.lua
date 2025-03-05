return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "nvim-telescope/telescope-live-grep-args.nvim",
      "nvim-telescope/telescope-project.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
      "debugloop/telescope-undo.nvim",
      "cljoly/telescope-repo.nvim",
    },
    config = function(_, opts)
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      -- Configure Telescope defaults
      telescope.setup({
        defaults = {
          prompt_prefix = "🔭 ",
          selection_caret = " ",
          path_display = { "smart" },
          file_ignore_patterns = { ".git/", "node_modules", "venv", ".cache" },
          mappings = {
            i = {
              ["<ESC>"] = actions.close,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
          project = {
            base_dirs = {
              { "/mnt/data/code", max_depth = 4 },
            },
          },
        },
      })

      -- horizontal_fused layout strategy
      local layout_strategies = require("telescope.pickers.layout_strategies")
      layout_strategies.horizontal_fused = function(picker, max_columns, max_lines, layout_config)
          local layout = layout_strategies.horizontal(picker, max_columns, max_lines, layout_config)
          layout.prompt.title = ""
          layout.results.title = ""
          layout.results.height = layout.results.height + 1
          layout.results.borderchars = { "─", "│", "─", "│", "╭", "┬", "┤", "├" }
          layout.prompt.borderchars = { "─", "│", "─", "│", "╭", "╮", "┴", "╰" }
          if layout.preview then
              layout.preview.title = ""
              layout.preview.borderchars = { "─", "│", "─", " ", "─", "╮", "╯", "─" }
          end
          return layout
      end

      -- Force transparency
      vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
      vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
      vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "#272727" })
      vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })
      vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none" })
      vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "none" })
      vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "none" })

      -- Load extensions
      telescope.load_extension("fzf")
      telescope.load_extension("file_browser")
      telescope.load_extension("project")
      telescope.load_extension("live_grep_args")
      telescope.load_extension("undo")
      telescope.load_extension("repo")

      -- Key mappings
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
      vim.keymap.set("n", "<leader>fl", telescope.extensions.live_grep_args.live_grep_args, { desc = "Live Grep (Args)" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
      vim.keymap.set("n", "<leader>fp", telescope.extensions.project.project, { desc = "Projects" })
      vim.keymap.set("n", "<leader>fu", telescope.extensions.undo.undo, { desc = "Undo Tree" })
      vim.keymap.set("n", "<leader>fr", telescope.extensions.repo.list, { desc = "Repositories" })
      vim.keymap.set("n", "<leader>fe", function()
        telescope.extensions.file_browser.file_browser({ respect_gitignore = false })
      end, { desc = "File Browser" })
    end
  },
  {
    "airblade/vim-rooter",
    init = function()
      vim.g.rooter_patterns = { ".git", "package.json", "pyproject.toml", "Cargo.toml", "init.lua" }
      vim.g.rooter_silent_chdir = 1
      vim.g.rooter_change_directory_command = "cd"
    end
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make"
  }
}
