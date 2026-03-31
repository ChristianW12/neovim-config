return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- Symbole für Dateitypen
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      window = {
        width = 30, -- Breite der Sidebar
        mappings = {
          ["<space>"] = "none", -- Leader-Taste im Baum deaktivieren
        },
      },
      filesystem = {
        filtered_items = {
          visible = true, -- Versteckte Dateien (z.B. .git) anzeigen
        },
        follow_current_file = {
          enabled = true, -- Den Explorer immer dort öffnen, wo man gerade arbeitet
        },
      },
    })

    -- Keymaps zum Ein-/Ausblenden
    vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Explorer ein-/ausblenden" })
    vim.keymap.set("n", "<leader>fe", "<cmd>Neotree focus<cr>", { desc = "Fokus auf Explorer" })
  end,
}
