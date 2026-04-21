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
map("n", "<leader>nh", ":nohl<CR>", { desc = "Remove search highlight", silent = true })

-- Saving file
map("n", "<leader>w", ":w<CR>", { desc = "Save file", silent = true })

-- Closing Neovim (with confirmation if there are unsaved changes)
map("n", "<C-q>", ":confirm q<CR>", { desc = "Quit Neovim", silent = true })

-- Force Closing Neovim (without confirmation)
map("n", "<C-Q>", ":qall!<CR>", { desc = "Force quit Neovim", silent = true })

-- Saving current colorscheme name in clipboard 
vim.keymap.set('n', '<leader>cth', function()
    local name = vim.g.colors_name or vim.cmd('colorscheme')
    vim.fn.setreg('+', name)
    print("Theme '" .. name .. "' copied to clipboard!")
end, { desc = 'Copy current colorscheme name to clipboard' })

-- Normal Mode: move single line up/down 
vim.keymap.set('n', '<A-j>', ':m .+1<CR>', { desc = 'line up' })
vim.keymap.set('n', '<A-k>', ':m .-2<CR>', { desc = 'line down' })

-- Visual Mode: move selected lines up/down 
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'move selected lines down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'move selected linesup' })

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
