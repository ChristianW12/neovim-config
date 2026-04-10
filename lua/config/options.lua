-- lua/config/options.lua
local opt = vim.opt

-- =========================
-- Basics / UI
-- =========================
opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.wrap =  true 
opt.conceallevel = 2 -- Show Obsidian UI (checkboxes, links)

-- Keep some context when scrolling
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Splits: new windows where you expect them
opt.splitright = true
opt.splitbelow = true

-- =========================
-- Indentation
-- =========================
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.smartindent = true

-- =========================
-- Search
-- =========================
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true
opt.path:append("**")  -- Cross-project search with :find

-- =========================
-- Files / Undo / Backup
-- =========================
opt.undofile = true
opt.swapfile = true
opt.backup = false
opt.writebackup = false

-- =========================
-- Performance / Behavior
-- =========================
opt.updatetime = 300          -- faster for CursorHold (useful later for LSP, GitSigns, etc.)
opt.timeoutlen = 400         -- snappier for leader mappings
opt.mouse = "a"              -- Mouse optional everywhere (trackpad users would otherwise be weird)

-- =========================
-- Clipboard (Linux)
-- =========================
opt.clipboard = "unnamedplus"

-- =========================
-- Folding
-- =========================
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldcolumn = "0"              -- Set to "1" if you want to see a narrow column for folds on the left
opt.foldlevel = 99               -- Open files without being folded
opt.foldlevelstart = 99
opt.foldenable = true            -- Generally allow folding

-- =========================
-- Nice-to-have, but not crazy
-- =========================
opt.completeopt = { "menu", "menuone", "noselect" } -- important later for autocomplete plugins, never hurts
