-- lua/config/keymaps.lua
local map = vim.keymap.set

-- =========================
-- Allgemeine Mappings
-- =========================
-- Zum nächsten Buffer springen
map("n", "L", ":bnext<CR>", { desc = "Nächster Buffer", silent = true })

-- Zum vorherigen Buffer springen
map("n", "H", ":bprevious<CR>", { desc = "Vorheriger Buffer", silent = true })

-- Buffer schließen
map("n", "<leader>x", ":bd<CR>", { desc = "Buffer schließen", silent = true })

-- =========================
-- Copilot Mappings
-- =========================
-- Einzelnes Wort akzeptieren
map("i", "<C-l>", "<Plug>(copilot-accept-word)", { desc = "Copilot Wort akzeptieren", remap = true, silent = true })

-- =========================
-- Obsidian Mappings (Globale Triggers)
-- =========================
-- Diese Mappings starten das Obsidian-Plugin bei Bedarf (Lazy Loading)
map("n", "<leader>os", "<cmd>ObsidianSearch<cr>", { desc = "Obsidian: Suche Text" })
map("n", "<leader>oq", "<cmd>ObsidianQuickSwitch<cr>", { desc = "Obsidian: Schnellwechsel Notiz" })

-- Erstellung und Verlinkung
map("n", "<leader>on", "<cmd>ObsidianNew<cr>", { desc = "Obsidian: Neue Notiz" })
map("v", "<leader>ol", "<cmd>ObsidianLink<cr>", { desc = "Obsidian: Link erstellen (Auswahl)" })
map("v", "<leader>on", "<cmd>ObsidianNewFromLink<cr>", { desc = "Obsidian: Notiz aus Link erstellen" })

-- Navigation und Daily Notes
map("n", "<leader>od", "<cmd>ObsidianToday<cr>", { desc = "Obsidian: Heute (Daily Note)" })
map("n", "<leader>ot", "<cmd>ObsidianTags<cr>", { desc = "Obsidian: Suche Tags" })
map("n", "<leader>ob", "<cmd>ObsidianBacklinks<cr>", { desc = "Obsidian: Backlinks anzeigen" })
