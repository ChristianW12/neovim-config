return {
  -- Das Haupt-Plugin
  "nvim-telescope/telescope.nvim",
  
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
        -- Hier könntest du Standard-Einstellungen anpassen
        -- z.B. wie das Fenster aussieht
        layout_strategy = "horizontal",
        layout_config = { height = 0.95 },
      },
    })
  end,
}
