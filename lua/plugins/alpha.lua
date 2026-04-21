return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Large ASCII logo for NEOVIM
    dashboard.section.header.val = {
      [[                               __                ]],
      [[  ___      __    ___   __  __ /\_\    ___ ___    ]],
      [[ /' _ `\  /'__`\ / __`\/\ \/\ \\/\ \  /' __` __`\  ]],
      [[ /\ \/\ \/\  __//\ \L\ \ \ \_/ |\ \ \ /\ \/\ \/\ \ ]],
      [[ \ \_\ \_\ \____\ \____/\ \___/  \ \_\\ \_\ \_\ \_\]],
      [[  \/_/\/_/\/____/\/___/  \/__/    \/_/ \/_/\/_/\/_/]],
    }

    -- Project information
    local current_dir = "  PROJECT: " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t"):upper()
    local full_path = "  PATH:    " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":~")

    -- Create a custom section for project info for better placement
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
        hl = "Special", -- A prominent color from your theme
        position = "center",
      },
    }

    -- Clear all buttons and footer
    dashboard.section.buttons.val = {}
    dashboard.section.footer.val = ""

    -- Define the layout: Logo first, then project info
    dashboard.opts.layout = {
      { type = "padding", val = 4 },
      dashboard.section.header,
      { type = "padding", val = 2 },
      project_info,
    }

    -- Highlights for the logo
    dashboard.section.header.opts.hl = "AlphaHeader"

    alpha.setup(dashboard.opts)
  end,
}
