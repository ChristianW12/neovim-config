return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local ts = require("nvim-treesitter")

      -- Compiler settings for Windows (Force GCC)
      local install = require("nvim-treesitter.install")
      install.prefer_git = true
      install.compilers = { "gcc" } -- Only allow GCC

      ts.setup({
        -- Parser list
        ensure_installed = { 
          "c", "lua", "vim", "vimdoc", "query", 
          "python", "javascript", "typescript", "bash", "html", "css",
          "markdown", "markdown_inline" 
        },
        -- Set sync_install to false so Neovim doesn't block on startup
        sync_install = false,
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
