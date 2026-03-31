return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation durch Änderungen
        map("n", "]c", function()
          if vim.wo.diff then return "]c" end
          vim.schedule(function() gs.next_hunk() end)
          return "<Ignore>"
        end, { expr = true, desc = "Nächste Änderung" })

        map("n", "[c", function()
          if vim.wo.diff then return "[c" end
          vim.schedule(function() gs.prev_hunk() end)
          return "<Ignore>"
        end, { expr = true, desc = "Vorherige Änderung" })

        -- Git Aktionen (unter <leader>g)
        map("n", "<leader>ghp", gs.preview_hunk, { desc = "Vorschau der Änderung" })
        map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, { desc = "Git Blame" })
        map("n", "<leader>ghs", gs.stage_hunk, { desc = "Änderung stagen" })
        map("n", "<leader>ghr", gs.reset_hunk, { desc = "Änderung rückgängig" })
        map("n", "<leader>ghu", gs.undo_stage_hunk, { desc = "Undo Stage Hunk" })
      end,
    })
  end,
}
