return {
  -- 1. Mason zum Installieren der LSP-Server
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = { border = "rounded" },
      })
    end,
  },

  -- 2. Mason-LSPConfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" },
      })
    end,
  },

  -- 3. nvim-lspconfig (Modernisiert für Neovim 0.11+)
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      -- Zentraler Ort für Tastenkombinationen (moderner Autocmd-Ansatz)
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          local opts = { buffer = ev.buf, silent = true }
          local map = vim.keymap.set

          map("n", "gd", vim.lsp.buf.definition, opts)
          map("n", "K", vim.lsp.buf.hover, opts)
          map("n", "<leader>rn", vim.lsp.buf.rename, opts)
          map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          map("n", "gr", vim.lsp.buf.references, opts)
        end,
      })

      -- Konfiguration für den Lua-Server über die neue API
      -- Wir nutzen vim.lsp.config statt require('lspconfig').lua_ls.setup
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
          },
        },
      })

      -- Aktiviere den Server
      vim.lsp.enable("lua_ls")

      -- Falls du weitere Server installierst (z.B. pyright), einfach hier aktivieren:
      -- vim.lsp.enable("pyright")
    end,
  },
}
