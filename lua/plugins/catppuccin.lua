return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000, -- Stellt sicher, dass das Theme vor allen anderen Plugins geladen wird
  config = function()
    -- Hier wird das Theme konfiguriert
    require("catppuccin").setup({
      flavour = "mocha", -- Optionen: latte, frappe, macchiato, mocha
      transparent_background = false,
      term_colors = true,
      integrations = {
        cmp = true,      -- Unterstützt Autocompletion-Farben
        gitsigns = true, -- Falls du Git-Plugins nutzt
        nvimtree = true,
        telescope = {
          enabled = true, -- Macht den Fuzzy Finder schöner
        },
        notify = true,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
      },
    })

    -- Dies ist der eigentliche Befehl, der das Theme aktiviert
    vim.cmd.colorscheme("catppuccin")
  end,
}
