local servers = {
    "vtsls",
    "texlab",
    "angularls",
    "lua_ls",
    "jdtls",
    "clangd",
    "pyright"
}

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
                ensure_installed = servers, -- use the list of servers defined above 
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

            -- Central location for keybindings and features
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(ev)
                    local opts = { buffer = ev.buf, silent = true }
                    local map = vim.keymap.set

                    map("n", "gd", vim.lsp.buf.definition, opts)
                    map("n", "K", vim.lsp.buf.hover, opts)
                    map("n", "<leader>rn", vim.lsp.buf.rename, opts)
                    map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                    map("n", "gr", vim.lsp.buf.references, opts)

                    local client = vim.lsp.get_client_by_id(ev.data.client_id)
                    
                    -- highlights all occurrences of the symbol under the cursor 
                    if client and client.server_capabilities.documentHighlightProvider then
                        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                            buffer = ev.buf,
                            callback = vim.lsp.buf.document_highlight,
                        })
                        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                            buffer = ev.buf,
                            callback = vim.lsp.buf.clear_references,
                        })
                    end

                    -- Inlay Hints 
                    if client and client.server_capabilities.inlayHintProvider then
                        map("n", "<leader>th", function()
                            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = ev.buf }))
                        end, { desc = "Toggle Inlay Hints", buffer = ev.buf })
                    end
                end,
            })

            -- auto-setup servers with common capabilities and special settings
            for _, lsp in ipairs(servers) do
                local config = {
                    capabilities = capabilities,
                }

                -- Spezielle Einstellungen für Lua
                if lsp == "lua_ls" then
                    config.settings = {
                        Lua = {
                            diagnostics = { globals = { "vim" } },
                            workspace = {
                                library = vim.api.nvim_get_runtime_file("", true),
                                checkThirdParty = false,
                            },
                        },
                    }
                end

                -- 
                vim.lsp.config(lsp, config)
                vim.lsp.enable(lsp)
            end
        end,
    },
}
