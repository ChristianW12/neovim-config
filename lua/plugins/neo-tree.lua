return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- Icons for file types
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      window = {
        width = 30, -- Width of the sidebar
        mappings = {
          ["<space>"] = "none", -- Disable leader key in the tree
        },
      },
      filesystem = {
        filtered_items = {
          visible = true, -- Show hidden files (e.g. .git)
        },
        follow_current_file = {
          enabled = true, -- Always open the explorer where you are currently working
        },
      },
    })

    -- Keymaps for toggling
    vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle Explorer" })
    vim.keymap.set("n", "<leader>fe", "<cmd>Neotree focus<cr>", { desc = "Focus on Explorer" })
  end,
}
