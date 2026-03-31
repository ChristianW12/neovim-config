-- lua/config/keymaps.lua
local map = vim.keymap.set

-- =========================
-- Allgemeine Mappings
-- =========================
-- Explorer öffnen (Netrw)
map("n", "<leader>e", ":Ex<CR>", { desc = "Datei-Explorer öffnen", silent = true })

-- =========================
-- Buffer Navigation
-- =========================
-- Zum nächsten Buffer springen
map("n", "L", ":bnext<CR>", { desc = "Nächster Buffer", silent = true })

-- Zum vorherigen Buffer springen
map("n", "H", ":bprevious<CR>", { desc = "Vorheriger Buffer", silent = true })

-- Buffer schließen
map("n", "<leader>x", ":bd<CR>", { desc = "Buffer schließen", silent = true })

-- =========================
-- Telescope Fuzzy Finder
-- =========================
-- Erfordert das Plugin 'telescope.nvim'
local builtin = require('telescope.builtin')

-- [F]ind [F]iles - Suche nach Dateinamen
map('n', '<leader>ff', builtin.find_files, { desc = "Finde Dateien" })

-- [F]ind [G]rep - Suche nach Text innerhalb von Dateien
map('n', '<leader>fg', builtin.live_grep, { desc = "Suche Text (Grep)" })

-- [F]ind [B]uffers - Suche in aktuell geöffneten Dateien
map('n', '<leader>fb', builtin.buffers, { desc = "Geöffnete Buffer suchen" })

-- [F]ind [H]elp - Suche in der Neovim-Hilfe
map('n', '<leader>fh', builtin.help_tags, { desc = "Neovim Hilfe durchsuchen" })

-- =========================
-- Copilot Mappings
-- =========================
-- Einzelnes Wort akzeptieren
map("i", "<C-l>", "<Plug>(copilot-accept-word)", { desc = "Copilot Wort akzeptieren", remap = true, silent = true })
