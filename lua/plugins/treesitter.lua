return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local ts = require("nvim-treesitter")

      -- Compiler settings for Windows + GCC
      local install = require("nvim-treesitter.install")
      install.prefer_git = true
      install.compilers = { "gcc" }

      -- New setup (v0.12+ / Main Branch Rewrite)
      ts.setup({
        -- Parser list (new syntax)
        install = { 
          "c", "lua", "vim", "vimdoc", "query", 
          "python", "javascript", "typescript", "bash", "html", "css",
          "markdown", "markdown_inline" 
        },
        -- Enable highlighting
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
