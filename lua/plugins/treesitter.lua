return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate", -- Aktualisiert die Parser automatisch
    config = function()
      local treesitter = require("nvim-treesitter")

      treesitter.setup({
        -- Hier kannst du Sprachen eintragen, die immer installiert sein sollen
        ensure_installed = { 
          "c", "lua", "vim", "vimdoc", "query", 
          "python", "javascript", "typescript", "bash", "html", "css" 
        },
        
        -- Installiert fehlende Parser automatisch, wenn du eine neue Datei öffnest
        auto_install = true,

        highlight = {
          enable = true, -- Das ist das wichtigste: Schaltet das moderne Highlighting ein
          additional_vim_regex_highlighting = false,
        },
        
        indent = {
          enable = true, -- Besseres automatisches Einrücken
        },
      })
    end,
  },
}
