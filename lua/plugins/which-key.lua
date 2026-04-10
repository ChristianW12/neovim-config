return {
  "folke/which-key.nvim",
  event = "VeryLazy", -- Loaded only when needed
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300 -- Wait time until the menu appears (ms)
  end,
  config = function()
    local wk = require("which-key")
    wk.setup({
      -- You can adjust the design here
      preset = "modern", -- Uses the new design of version 3
      win = {
        border = "rounded",
      },
    })

    -- Name groups for better overview
    wk.add({
      { "<leader>f", group = "File Search (Telescope)" },
      { "<leader>b", group = "Buffers/Tabs" },
      { "<leader>l", group = "LSP/Code Help" },
      { "<leader>e", group = "Explorer" },
      { "<leader>g", group = "Git" },
      { "<leader>gh", group = "Git Hunks (Changes)" },
    })
  end,
}
