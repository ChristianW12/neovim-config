-- init.lua
-- 

-- Leader am besten VOR keymaps setzen
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Core laden
require("config.options")
require("config.keymaps")
