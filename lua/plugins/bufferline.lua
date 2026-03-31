return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers", -- Zeigt offene Dateien (Buffer)
        separator_style = "slant", -- Schräge Trenner für eine moderne Optik
        always_show_bufferline = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        diagnostics = "nvim_lsp", -- Zeigt LSP-Fehler direkt in den Tabs an
        offsets = {
          {
            filetype = "neo-tree", -- Platzhalter für den File-Explorer (falls installiert)
            text = "File Explorer",
            text_align = "left",
            separator = true,
          },
        },
      },
    })

    -- Keymaps zum schnellen Wechseln zwischen Buffers
    vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Nächster Buffer" })
    vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Vorheriger Buffer" })
    vim.keymap.set("n", "<leader>bp", "<cmd>BufferLinePick<cr>", { desc = "Buffer auswählen" })
    vim.keymap.set("n", "<leader>bc", "<cmd>BufferLinePickClose<cr>", { desc = "Buffer zum Schließen auswählen" })
  end,
}
