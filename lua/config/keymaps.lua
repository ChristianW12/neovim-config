-- lua/config/keymaps.lua
local map = vim.keymap.set

-- =========================
-- General mappings
-- =========================
-- Jump to next buffer
map("n", "L", ":bnext<CR>", { desc = "Next buffer", silent = true })
-- Jump to previous buffer
map("n", "H", ":bprevious<CR>", { desc = "Previous buffer", silent = true })
-- Close buffer
map("n", "<leader>x", ":bd<CR>", { desc = "Close buffer", silent = true })

-- Remove search highlights
map("n", "nh", ":nohl<CR>", { desc = "Remove search highlight", silent = true })

-- Saving file
map("n", "<leader>w", ":w<CR>", { desc = "Save file", silent = true })

-- Closing Neovim (with confirmation if there are unsaved changes)
map("n", "<C-q>", ":confirm q<CR>", { desc = "Quit Neovim", silent = true })

-- =========================
-- Obsidian Mappings (Global triggers)
-- =========================
-- These mappings start the Obsidian plugin on demand (lazy loading)
map("n", "<leader>os", "<cmd>ObsidianSearch<cr>", { desc = "Obsidian: Search text" })
map("n", "<leader>oq", "<cmd>ObsidianQuickSwitch<cr>", { desc = "Obsidian: Quick switch note" })
-- Creation and linking
map("n", "<leader>on", "<cmd>ObsidianNew<cr>", { desc = "Obsidian: New note" })
map("v", "<leader>ol", "<cmd>ObsidianLink<cr>", { desc = "Obsidian: Create link (selection)" })
map("v", "<leader>on", "<cmd>ObsidianNewFromLink<cr>", { desc = "Obsidian: Create note from link" })
-- Navigation and daily notes
map("n", "<leader>od", "<cmd>ObsidianToday<cr>", { desc = "Obsidian: Today (daily note)" })
map("n", "<leader>ot", "<cmd>ObsidianTags<cr>", { desc = "Obsidian: Search tags" })
map("n", "<leader>ob", "<cmd>ObsidianBacklinks<cr>", { desc = "Obsidian: Show backlinks" })
