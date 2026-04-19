return {
  -- The main plugin
  "nvim-telescope/telescope.nvim",

  -- Keymaps for lazy loading (plugin is only loaded when one of these keys is pressed)
  keys = {
    { "ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "fg", "<cmd>Telescope live_grep<cr>", desc = "Search Text (Grep)" },
    { "fb", "<cmd>Telescope buffers<cr>", desc = "Search Open Buffers" },
    { "fh", "<cmd>Telescope help_tags<cr>", desc = "Search Neovim Help" },
    { "<leader>th", "<cmd>Telescope colorscheme enable_preview=true<cr>", desc = "Colorscheme Preview" },
  },
  
  -- Dependencies that Telescope needs to function
  dependencies = { 
    "nvim-lua/plenary.nvim",
    { "nvim-tree/nvim-web-devicons", enabled = true }, -- For nice file icons
  },

  -- The plugin configuration
  config = function()
    local telescope = require("telescope")
    
    telescope.setup({
      defaults = {
        -- Directories and files that you NEVER want to see
        file_ignore_patterns = {
          "%.git[/\\]",      -- Ignores the .git folder (Windows & Linux)
          "node_modules[/\\]",
          "%.cache",
          "dist[/\\]",
          "build[/\\]",
          "%.git$",          -- Ignores the .git file itself
        },
        layout_strategy = "horizontal",
        layout_config = { height = 0.95 },
      },
      pickers = {
        find_files = {
          -- Here you can set whether hidden files (dotfiles) 
          -- should be displayed, but without the .git folder
          hidden = true,
          -- Ensures that .gitignore is still respected
          no_ignore = false,
        },
      },
    })
  end,
}
