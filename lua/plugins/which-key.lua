return {
  "folke/which-key.nvim",
  event = "VeryLazy", -- Wird nur geladen, wenn benötigt
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300 -- Wartezeit bis das Menü erscheint (ms)
  end,
  config = function()
    local wk = require("which-key")
    wk.setup({
      -- Hier kannst du das Design anpassen
      preset = "modern", -- Nutzt das neue Design der Version 3
      win = {
        border = "rounded",
      },
    })

    -- Gruppen benennen für bessere Übersicht
    wk.add({
      { "<leader>f", group = "Dateisuche (Telescope)" },
      { "<leader>b", group = "Buffer/Tabs" },
      { "<leader>l", group = "LSP/Code-Hilfe" },
      { "<leader>e", group = "Explorer" },
      { "<leader>g", group = "Git" },
      { "<leader>gh", group = "Git Hunks (Änderungen)" },
    })
  end,
}
