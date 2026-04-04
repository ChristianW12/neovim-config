return {
    "github/copilot.vim",
    config = function()
        vim.g.copilot_no_tab_map = true
        vim.g.copilot_assume_mapped = true

        -- Vollständige Annahme des Vorschlags mit CTRL + O
        vim.keymap.set("i", "<C-o>", 'copilot#Accept("\\<CR>")', {
            expr = true,
            replace_keycodes = false,
            silent = true,
        })

        -- Nächstes Wort annehmen mit CTRL + L
        vim.keymap.set("i", "<C-l>", 'copilot#AcceptWord()', {
            expr = true,
            replace_keycodes = false,
            silent = true,
        })
    end,
}
