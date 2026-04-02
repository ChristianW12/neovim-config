return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local ts = require("nvim-treesitter")

      -- Compiler-Einstellungen für Windows + GCC
      local install = require("nvim-treesitter.install")
      install.prefer_git = true
      install.compilers = { "gcc" }

      -- Neues Setup (v0.12+ / Main Branch Rewrite)
      ts.setup({
        -- Parser-Liste (neue Syntax)
        install = { 
          "c", "lua", "vim", "vimdoc", "query", 
          "python", "javascript", "typescript", "bash", "html", "css",
          "markdown", "markdown_inline" 
        },
        -- Highlighting aktivieren
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
