return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local ts = require("nvim-treesitter")

      -- Compiler settings for Windows (Zwinge GCC)
      local install = require("nvim-treesitter.install")
      install.prefer_git = true
      install.compilers = { "gcc" } -- Nur GCC erlauben

      ts.setup({
        -- Parser list
        ensure_installed = { 
          "c", "lua", "vim", "vimdoc", "query", 
          "python", "javascript", "typescript", "bash", "html", "css",
          "markdown", "markdown_inline" 
        },
        -- Sync_install auf false setzen, damit Neovim nicht beim Starten blockiert
        sync_install = false,
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
