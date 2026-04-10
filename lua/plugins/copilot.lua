return {
    "github/copilot.vim",
    config = function()
        vim.g.copilot_no_tab_map = true
        vim.g.copilot_assume_mapped = true

        -- Accept the full suggestion with CTRL + O
        vim.keymap.set("i", "<C-o>", 'copilot#Accept("\\<CR>")', {
            expr = true,
            replace_keycodes = false,
            silent = true,
        })

        -- Accept the next word with CTRL + L
        vim.keymap.set("i", "<C-l>", 'copilot#AcceptWord()', {
            expr = true,
            replace_keycodes = false,
            silent = true,
        })
    end,
}
