-- plugins/dashboard.lua
return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
        require("dashboard").setup({
            theme = "doom", -- Set the theme to 'hyper'
            config = {
                -- Customize the header (ASCII art or text)
                -- Shortcut configurations
                header = {"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                          "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⣿⠀⠀⠀⢠⣾⣧⣤⡖⠀⠀⠀⠀⠀⠀⠀",
                          "⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⠋⠀⠉⠀⢄⣸⣿⣿⣿⣿⣿⣥⡤⢶⣿⣦⣀⡀",
                          "⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⡆⠀⠀⠀⣙⣛⣿⣿⣿⣿⡏⠀⠀⣀⣿⣿⣿⡟",
                          "⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⠷⣦⣤⣤⣬⣽⣿⣿⣿⣿⣿⣿⣿⣟⠛⠿⠋⠀",
                          "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⠋⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⡆⠀⠀",
                          "⠀⠀⠀⠀⣠⣶⣶⣶⣿⣦⡀⠘⣿⣿⣿⣿⣿⣿⣿⣿⠿⠋⠈⢹⡏⠁⠀⠀",
                          "⠀⠀⠀⢀⣿⡏⠉⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡆⠀⢀⣿⡇⠀⠀⠀",
                          "⠀⠀⠀⢸⣿⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣟⡘⣿⣿⣃⠀⠀⠀",
                          "⣴⣷⣀⣸⣿⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⠹⣿⣯⣤⣾⠏⠉⠉⠉⠙⠢⠀",
                          "⠈⠙⢿⣿⡟⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣄⠛⠉⢩⣷⣴⡆⠀⠀⠀⠀⠀",
                          "⠀⠀⠀⠋⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⣀⡠⠋⠈⢿⣇⠀⠀⠀⠀⠀",
                          "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⠿⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀"},

                center = {{
                    icon = "🔍",
                    desc = " Find File",
                    group = "DashboardShortCut",
                    key = "f",
                    action = "Telescope find_files"
                }, {
                    icon = "📄",
                    desc = " Recent Files",
                    group = "DashboardShortCut",
                    key = "r",
                    action = "Telescope oldfiles"
                }, {
                    icon = "🔖",
                    desc = " Bookmarks",
                    group = "DashboardShortCut",
                    key = "m",
                    action = "Telescope marks"
                }, {
                    icon = "⚙️ ",
                    desc = " Open Config",
                    group = "DashboardShortCut",
                    key = "c",
                    action = ":e $MYVIMRC<CR>" -- Opens the Neovim configuration file
                }, {
                    icon = "🔎",
                    desc = " Search Text",
                    group = "DashboardShortCut",
                    key = "s",
                    action = "Telescope live_grep" -- Search for text in the project
                }, {
                    icon = "📚",
                    desc = " Open Documentation",
                    group = "DashboardShortCut",
                    key = "d",
                    action = "Telescope help_tags" -- Open Neovim documentation
                }}
            },
            hide = {
                statusline = false, -- Hide the statusline
                tabline = false, -- Show the tabline
                winbar = false -- Show the winbar
            }
        })
    end,
    dependencies = {"nvim-tree/nvim-web-devicons"} -- Required dependency
}
