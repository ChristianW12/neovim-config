return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",           -- Quellen aus dem aktuellen Text
    "hrsh7th/cmp-path",             -- Quellen aus Dateipfaden
    "L3MON4D3/LuaSnip",             -- Snippet Engine (Zwingend erforderlich)
    "saadparwaiz1/cmp_luasnip",     -- Snippet Quelle für cmp
    "hrsh7th/cmp-nvim-lsp",         -- LSP Quelle für cmp
    "onsails/lspkind.nvim",         -- Schöne Icons im Menü
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- Vorheriger Vorschlag
        ["<C-j>"] = cmp.mapping.select_next_item(), -- Nächster Vorschlag
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),     -- Menü manuell öffnen
        ["<C-e>"] = cmp.mapping.abort(),            -- Menü schließen
        ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Auswählen mit Enter
      }),
      -- Woher kommen die Vorschläge?
      sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- 1. LSP (Code-Intelligenz)
        { name = "luasnip" },  -- 2. Snippets
        { name = "buffer" },   -- 3. Text aus der aktuellen Datei
        { name = "path" },     -- 4. Dateipfade
      }),
      -- Schickes Design mit Icons
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
    })
  end,
}
