return { {
  enabled = false,
  "folke/flash.nvim",
  ---@type Flash.Config
  opts = {
    search = {
      forward = true,
      multi_window = false,
      wrap = false,
      incremental = true
    }
  }
}, {
  "echasnovski/mini.hipatterns",
  event = "BufReadPre",
  opts = {
    highlighters = {
      hsl_color = {
        pattern = "hsl%(%d+,? %d+%%?,? %d+%%?%)",
        group = function(_, match)
          local utils = require("solarized-osaka.hsl")
          local nh, ns, nl = match:match("hsl%((%d+),? (%d+)%%?,? (%d+)%%?%)")
          local h, s, l = tonumber(nh), tonumber(ns), tonumber(nl)
          local hex_color = utils.hslToHex(h, s, l)
          return MiniHipatterns.compute_hex_color_group(hex_color, "bg")
        end
      }
    }
  }
}, {
  "dinhhuy258/git.nvim",
  event = "BufReadPre",
  opts = {
    keymaps = {
      blame = "<Leader>gb",
      browse = "<Leader>go"
    }
  }
}, {
  "telescope.nvim",
  dependencies = { {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make"
  }, "nvim-telescope/telescope-file-browser.nvim" },
  keys = { {
    "<leader>fP",
    function()
      require("telescope.builtin").find_files({
        cwd = require("lazy.core.config").options.root
      })
    end,
    desc = "Find Plugin File"
  }, {
    ";f",
    function()
      require("telescope.builtin").find_files({
        no_ignore = false,
        hidden = true
      })
    end,
    desc = "Lists files in your current working directory, respects .gitignore"
  }, {
    ";r",
    function()
      require("telescope.builtin").live_grep({
        additional_args = { "--hidden" }
      })
    end,
    desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore"
  }, {
    "\\\\",
    function()
      require("telescope.builtin").buffers()
    end,
    desc = "Lists open buffers"
  }, {
    ";t",
    function()
      require("telescope.builtin").help_tags()
    end,
    desc = "Lists available help tags and opens a new window with the relevant help info on <cr>"
  }, {
    ";;",
    function()
      require("telescope.builtin").resume()
    end,
    desc = "Resume the previous telescope picker"
  }, {
    ";e",
    function()
      require("telescope.builtin").diagnostics()
    end,
    desc = "Lists Diagnostics for all open buffers or a specific buffer"
  }, {
    ";s",
    function()
      require("telescope.builtin").treesitter()
    end,
    desc = "Lists Function names, variables, from Treesitter"
  }, {
    "sf",
    function()
      local telescope = require("telescope")
      local function telescope_buffer_dir()
        return vim.fn.expand("%:p:h")
      end

      telescope.extensions.file_browser.file_browser({
        path = "%:p:h",
        cwd = telescope_buffer_dir(),
        respect_gitignore = false,
        hidden = true,
        grouped = true,
        previewer = false,
        initial_mode = "normal",
        layout_config = {
          height = 40
        }
      })
    end,
    desc = "Open File Browser with the path of the current buffer"
  } },
  config = function(_, opts)
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local fb_actions = require("telescope").extensions.file_browser.actions

    opts.defaults = {
      wrap_results = true,
      layout_strategy = "horizontal",
      layout_config = {
        prompt_position = "top"
      },
      sorting_strategy = "ascending",
      winblend = 0
    }
    opts.pickers = {
      diagnostics = {
        theme = "ivy",
        initial_mode = "normal",
        layout_config = {
          preview_cutoff = 9999
        }
      }
    }
    opts.extensions = {
      file_browser = {
        theme = "dropdown",
        hijack_netrw = true,
        mappings = {
          ["n"] = {
            ["N"] = fb_actions.create,
            ["h"] = fb_actions.goto_parent_dir,
            ["/"] = function()
              vim.cmd("startinsert")
            end,
            ["<C-u>"] = function(prompt_bufnr)
              for _ = 1, 10 do
                actions.move_selection_previous(prompt_bufnr)
              end
            end,
            ["<C-d>"] = function(prompt_bufnr)
              for _ = 1, 10 do
                actions.move_selection_next(prompt_bufnr)
              end
            end,
            ["<PageUp>"] = actions.preview_scrolling_up,
            ["<PageDown>"] = actions.preview_scrolling_down
          }
        }
      }
    }
    telescope.setup(opts)
    telescope.load_extension("fzf")
    telescope.load_extension("file_browser")
  end
}, {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    modes = {
      search = { enabled = false },
      char = { enabled = false },
      jump = {
        autojump = true,
        label = { exclude = "hjklyuiopqwertasdgzxcvbm" }
      }
    }
  },
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
  },
},
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon").setup()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      vim.keymap.set("n", "<leader>a", mark.add_file)
      vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
      vim.keymap.set("n", "<C-j>", function() ui.nav_file(1) end)
      vim.keymap.set("n", "<C-k>", function() ui.nav_file(2) end)
      vim.keymap.set("n", "<C-l>", function() ui.nav_file(3) end)
      vim.keymap.set("n", "<C-;>", function() ui.nav_file(4) end)
    end
  }
}
