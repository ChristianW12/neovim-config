-- init.lua

-- 1. LEADER KEYS
-- Diese müssen ganz oben stehen, damit Plugins sie beim Laden sofort kennen.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 2. BOOTSTRAP LAZY.NVIM
-- Dieser Block sorgt dafür, dass Neovim den Plugin-Manager selbst herunterlädt, 
-- falls er auf deinem System noch nicht existiert.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Fehler beim Klonen von lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nDrücke eine beliebige Taste zum Beenden...", "None" },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

-- Füge den Pfad von lazy.nvim zum internen Suchpfad (runtimepath) hinzu.
vim.opt.rtp:prepend(lazypath)

-- 3. SETUP LAZY.NVIM
-- Hier konfigurieren wir den Manager und sagen ihm, wo er Plugins suchen soll.
require("lazy").setup({
  spec = {
    -- Wir sagen lazy, dass er alle Dateien im Ordner 'lua/plugins/' laden soll.
    { import = "plugins" },
  },
  -- Deaktiviert die automatische Prüfung auf Updates beim Start
  checker = { enabled = false },
  -- Deaktiviert Benachrichtigungen bei Konfigurationsänderungen
  change_detection = { notify = false },
  -- Macht das UI von lazy etwas dezenter
  ui = {
    border = "rounded",
  },
})

-- 4. CORE CONFIGURATION
-- Erst wenn der Plugin-Manager bereit ist, laden wir deine eigenen Einstellungen.
require("config.options")
require("config.keymaps")
