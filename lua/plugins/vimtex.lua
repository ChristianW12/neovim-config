return {
  "lervag/vimtex",
  lazy = false, -- VimTeX sollte für .tex Dateien immer geladen sein
  init = function()
    -- VimTeX Konfiguration (Plattformübergreifend)
    if vim.fn.has("win32") == 1 then
      -- Windows Setup (SumatraPDF)
      -- Hinweis: SumatraPDF muss im System-PATH liegen
      vim.g.vimtex_view_general_viewer = "SumatraPDF"
      vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
    elseif vim.fn.has("unix") == 1 then
      -- Linux Setup (Zathura)
      -- Hinweis: zathura-pdf-poppler sollte installiert sein
      vim.g.vimtex_view_method = "zathura"
    end

    -- Gemeinsame Einstellungen
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_view_automatic = 1 -- Öffnet PDF automatisch bei Kompilierungsstart
    
    -- Quickfix-Fenster nicht automatisch öffnen (optional, verhindert Fokusverlust)
    -- vim.g.vimtex_quickfix_mode = 0

    -- Syntax-Highlighting via VimTeX (oft besser für LaTeX als Treesitter)
    vim.g.vimtex_syntax_enabled = 1
  end,
}
