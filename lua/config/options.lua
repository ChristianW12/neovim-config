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

-- Beim Scrollen immer etwas Kontext lassen
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Splits: neue Fenster dort, wo man sie erwartet
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
opt.path:append("**")  -- Projektübergreifende Suche mit :find

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
opt.updatetime = 300          -- schneller für CursorHold (später nützlich für LSP, GitSigns etc.)
opt.timeoutlen = 400         -- snappier bei Leader-Mappings
opt.mouse = "a"              -- Maus optional überall (Trackpad-User werden sonst komisch)

-- =========================
-- Clipboard (Linux)
-- =========================
opt.clipboard = "unnamedplus"

-- =========================
-- Folding (Einklappen)
-- =========================
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldcolumn = "0"              -- Setze auf "1", wenn du links eine schmale Spalte für Folds sehen willst
opt.foldlevel = 99               -- Dateien nicht eingeklappt öffnen
opt.foldlevelstart = 99
opt.foldenable = true            -- Folding generell erlauben

-- =========================
-- Nice-to-have, aber nicht crazy
-- =========================
opt.completeopt = { "menu", "menuone", "noselect" } -- später wichtig für Autocomplete-Plugins, schadet nie
