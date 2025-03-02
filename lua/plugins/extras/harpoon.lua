return {
  "ThePrimeagen/harpoon",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("harpoon").setup()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Add file to Harpoon" })
    vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Toggle Harpoon Menu" })
    vim.keymap.set("n", "<C-j>", function() ui.nav_file(1) end, { desc = "Harpoon: file 1" })
    vim.keymap.set("n", "<C-k>", function() ui.nav_file(2) end, { desc = "Harpoon: file 2" })
    vim.keymap.set("n", "<C-l>", function() ui.nav_file(3) end, { desc = "Harpoon: file 3" })
    vim.keymap.set("n", "<C-;>", function() ui.nav_file(4) end, { desc = "Harpoon: file 4" })
  end,
}
