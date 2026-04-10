return {
  "lervag/vimtex",
  lazy = false, -- VimTeX should always be loaded for .tex files
  init = function()
    -- VimTeX Configuration (Cross-platform)
    if vim.fn.has("win32") == 1 then
      -- Windows Setup (SumatraPDF)
      -- Note: SumatraPDF must be in the system PATH
      vim.g.vimtex_view_general_viewer = "SumatraPDF"
      vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
    elseif vim.fn.has("unix") == 1 then
      -- Linux Setup (Zathura)
      -- Note: zathura-pdf-poppler should be installed
      vim.g.vimtex_view_method = "zathura"
    end

    -- Common settings
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_view_automatic = 1 -- Automatically opens PDF at the start of compilation
    
    -- Do not automatically open Quickfix window (optional, prevents focus loss)
    -- vim.g.vimtex_quickfix_mode = 0

    -- Syntax highlighting via VimTeX (often better for LaTeX than Treesitter)
    vim.g.vimtex_syntax_enabled = 1
  end,
}
