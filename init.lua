-- init.lua
-- 1. LEADER KEYS
-- These must be at the very top so plugins know them immediately when loading.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- WINDOWS FIX: Ensure GCC is preferred over cl.exe
if vim.fn.has("win32") == 1 then
  vim.env.CC = "gcc"
end

-- 2. BOOTSTRAP LAZY.NVIM
-- This block ensures that Neovim downloads the plugin manager itself
-- if it doesn't already exist on your system.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Error cloning lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit...", "None" },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

-- Add the path of lazy.nvim to the internal search path (runtimepath).
vim.opt.rtp:prepend(lazypath)

-- 3. SETUP LAZY.NVIM
-- Here we configure the manager and tell it where to look for plugins.
require("lazy").setup({
  spec = {
    -- We tell lazy to load all files in the 'lua/plugins/' folder.
    { import = "plugins" },
    {import = "plugins.themes"},
  },
  -- Disables automatic check for updates on startup
  checker = { enabled = false },
  -- Disables notifications on configuration changes
  change_detection = { notify = false },
  -- Makes the lazy UI a bit more subtle
  ui = {
    border = "rounded",
  },
})

-- 4. CORE CONFIGURATION
-- Only when the plugin manager is ready do we load your own settings.
require("config.options")
require("config.keymaps")
