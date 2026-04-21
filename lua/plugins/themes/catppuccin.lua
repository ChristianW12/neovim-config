return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000, -- Ensures the theme is loaded before all other plugins
  config = function()
    -- Theme configuration
    require("catppuccin").setup({
      flavour = "mocha", -- Options: latte, frappe, macchiato, mocha
      transparent_background = false,
      term_colors = true,
      integrations = {
        cmp = true,      -- Supports autocompletion colors
        gitsigns = true, -- If you use git plugins
        nvimtree = true,
        telescope = {
          enabled = true, -- Makes the fuzzy finder look better
        },
        notify = true,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
      },
    })
  end,
}
