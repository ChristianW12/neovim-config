return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "vault",
        path = function()
          return vim.fn.getcwd() -- Uses the folder where Neovim was started
        end,
      },
    },
    completion = {
      nvim_cmp = true, -- Switched back on!
      min_chars = 2,
    },
    notes_subdir = "",
    new_notes_location = "notes_subdir",
    disable_frontmatter = true, -- Disables the automatic creation of metadata at the top of the file
    mappings = {
      -- Overwrite 'gf' to work with obsidian links
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- Toggle checkbox
      ["<leader>ch"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
      -- Toggle checkbox (Obsidian style)
      ["<C-c>"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
    },
    ui = {
      enable = true,
      update_debounce = 200,
      checkboxes = {
        [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
        ["x"] = { char = "", hl_group = "ObsidianDone" },
      },
    },
  },
  config = function(_, opts)
    require("obsidian").setup(opts)

    -- Markdown formatting shortcuts in insert mode
    -- Bold: **** (cursor in the middle)
    vim.keymap.set("i", "<C-b>", "****<Left><Left>", { desc = "Markdown: Bold", buffer = true })
    -- Underline/Italic: ____ (cursor in the middle)
    vim.keymap.set("i", "<C-u>", "____<Left><Left>", { desc = "Markdown: Underline/Italic", buffer = true })
    -- Toggle/Create checkbox in Insert Mode
    vim.keymap.set("i", "<C-c>", function()
      require("obsidian").util.toggle_checkbox()
    end, { desc = "Markdown: Toggle Checkbox", buffer = true })
  end,
}
