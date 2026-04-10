return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers", -- Shows open files (buffers)
        separator_style = "slant", -- Slanted separators for a modern look
        always_show_bufferline = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        diagnostics = "nvim_lsp", -- Shows LSP errors directly in the tabs
        offsets = {
          {
            filetype = "neo-tree", -- Placeholder for the file explorer (if installed)
            text = "File Explorer",
            text_align = "left",
            separator = true,
          },
        },
      },
    })

    -- Keymaps for quickly switching between buffers
    vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
    vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer" })
    vim.keymap.set("n", "<leader>bp", "<cmd>BufferLinePick<cr>", { desc = "Select buffer" })
    vim.keymap.set("n", "<leader>bc", "<cmd>BufferLinePickClose<cr>", { desc = "Select buffer to close" })
  end,
}
