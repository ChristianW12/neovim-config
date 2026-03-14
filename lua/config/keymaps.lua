-- lua/config/keymaps.lua
local map = vim.keymap.set

-- Leader + f für schnelle Dateisuche
map("n", "<leader>f", ":find ", { noremap = true, silent = false })

map("n", "<leader>e", ":Ex<CR>", { noremap = true, silent = true })
