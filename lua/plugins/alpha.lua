return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Großes ASCII Logo für NEOVIM
    dashboard.section.header.val = {
      [[                               __                ]],
      [[  ___      __    ___   __  __ /\_\    ___ ___    ]],
      [[ /' _ `\  /'__`\ / __`\/\ \/\ \\/\ \  /' __` __`\  ]],
      [[ /\ \/\ \/\  __//\ \L\ \ \ \_/ |\ \ \ /\ \/\ \/\ \ ]],
      [[ \ \_\ \_\ \____\ \____/\ \___/  \ \_\\ \_\ \_\ \_\]],
      [[  \/_/\/_/\/____/\/___/  \/__/    \/_/ \/_/\/_/\/_/]],
    }

    -- Projekt-Informationen
    local current_dir = "  PROJEKT: " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t"):upper()
    local full_path = "  PFAD:    " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":~")

    -- Wir erstellen eine eigene Sektion für die Projekt-Infos, um sie besser zu platzieren
    local project_info = {
      type = "text",
      val = {
        "",
        "",
        current_dir,
        "  " .. string.rep("━", #current_dir),
        full_path,
      },
      opts = {
        hl = "Special", -- Eine auffällige Farbe aus deinem Theme
        position = "center",
      },
    }

    -- Buttons komplett leeren
    dashboard.section.buttons.val = {}
    dashboard.section.footer.val = ""

    -- Das Layout definieren: Erst Logo, dann Projekt-Info
    dashboard.opts.layout = {
      { type = "padding", val = 4 },
      dashboard.section.header,
      { type = "padding", val = 2 },
      project_info,
    }

    -- Highlights für das Logo
    dashboard.section.header.opts.hl = "AlphaHeader"

    alpha.setup(dashboard.opts)
  end,
}
