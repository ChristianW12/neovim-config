return {
    -- 1. Mason to install LSP servers
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
                ensure_installed = {
                    "vtsls",
                    "texlab",
                    "angularls",
                    "lua_ls",
                    "jdtls",
                    "clangd",
                    "pyright"
                }
            })
        end,
    },

    -- 3. nvim-lspconfig (Modernized for Neovim 0.11+)
    {
        "neovim/nvim-lspconfig",
        dependencies = { "williamboman/mason-lspconfig.nvim", "hrsh7th/cmp-nvim-lsp" },
        config = function()
            -- Load capabilities for CMP
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Central location for keybindings
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

            -- Configuration for the Lua server via the new API
            -- We use vim.lsp.config instead of require('lspconfig').lua_ls.setup
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

            -- Enable the server
            vim.lsp.enable("lua_ls")

            -- If you install other servers (e.g. pyright), simply enable them here:
            -- vim.lsp.enable("pyright")
        end,
    },
}
