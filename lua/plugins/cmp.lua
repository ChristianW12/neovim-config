return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",           -- Sources from current text
    "hrsh7th/cmp-path",             -- Sources from file paths
    "L3MON4D3/LuaSnip",             -- Snippet Engine (Required)
    "saadparwaiz1/cmp_luasnip",     -- Snippet source for cmp
    "hrsh7th/cmp-nvim-lsp",         -- LSP source for cmp
    "onsails/lspkind.nvim",         -- Beautiful icons in the menu
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
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- Previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- Next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),     -- Manually open the menu
        ["<C-e>"] = cmp.mapping.abort(),            -- Close the menu
        ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Select with Enter
      }),
      -- Where do the suggestions come from?
      sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- 1. LSP (Code intelligence)
        { name = "luasnip" },  -- 2. Snippets
        { name = "buffer" },   -- 3. Text from current file
        { name = "path" },     -- 4. File paths
      }),
      -- Elegant design with icons
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
    })
  end,
}
