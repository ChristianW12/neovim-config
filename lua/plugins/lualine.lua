return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto", -- Erkennt automatisch dein Farbschema (z.B. Catppuccin)
        component_separators = { left = "│", right = "│" },
        section_separators = { left = "", right = "" },
        globalstatus = true, -- Eine durchgehende Statuszeile für alle Fenster
      },
      sections = {
        lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
        lualine_b = { "filename", "branch", "diff" },
        lualine_c = { "diagnostics" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { { "location", separator = { right = "" }, left_padding = 2 } },
      },
    })
  end,
}
