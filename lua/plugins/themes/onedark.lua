return {
    "navarasu/onedark.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        require('onedark').setup {
            style = 'darker'
            -- possilbe values: 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer'
            -- see a preview for styles on https://github.com/navarasu/onedark.nvim
        }
        require('onedark').load()
    end
}
