return {
  -- Das Haupt-Plugin
  "nvim-telescope/telescope.nvim",

  -- Keymaps für Lazy Loading (Plugin wird erst geladen, wenn eine dieser Tasten gedrückt wird)
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Finde Dateien" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Suche Text (Grep)" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Geöffnete Buffer suchen" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Neovim Hilfe durchsuchen" },
  },
  
  -- Abhängigkeiten, die Telescope braucht, um zu funktionieren
  dependencies = { 
    "nvim-lua/plenary.nvim",
    { "nvim-tree/nvim-web-devicons", enabled = true }, -- Für schöne Datei-Icons
  },

  -- Die Konfiguration des Plugins
  config = function()
    local telescope = require("telescope")
    
    telescope.setup({
      defaults = {
        -- Verzeichnisse und Dateien, die du NIE sehen willst
        file_ignore_patterns = {
          "%.git[/\\]",      -- Ignoriert den .git Ordner (Windows & Linux)
          "node_modules[/\\]",
          "%.cache",
          "dist[/\\]",
          "build[/\\]",
          "%.git$",          -- Ignoriert die .git Datei selbst
        },
        layout_strategy = "horizontal",
        layout_config = { height = 0.95 },
      },
      pickers = {
        find_files = {
          -- Hier kannst du einstellen, ob versteckte Dateien (dotfiles) 
          -- angezeigt werden sollen, aber ohne den .git Ordner
          hidden = true,
          -- Sorgt dafür, dass .gitignore trotzdem beachtet wird
          no_ignore = false,
        },
      },
    })
  end,
}
