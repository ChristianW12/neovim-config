
-- Erstelle eine Tabelle für die Optionen
local options = {
  number = true,                -- Zeilennummern anzeigen
  relativenumber = true,       -- Relative Zeilennummern (optional)
  autoindent = true,            -- Automatisches Einrücken
  smartindent = true,           -- Intelligentes Einrücken
  ignorecase = true,            -- Fallunterscheidung bei der Suche ignorieren
  smartcase = true,             -- Fallunterscheidung, wenn Großbuchstaben verwendet werden
  incsearch = true,             -- Inkrementelle Suche
  hlsearch = true,              -- Suchergebnisse hervorheben
  tabstop = 4,                  -- Tabulatorbreite
  shiftwidth = 4,               -- Breite für Einrückungen
  expandtab = true,             -- Tabs in Leerzeichen umwandeln
  laststatus = 2,               -- Statusleiste immer anzeigen
  ruler = true,                 -- Zeilen- und Spalteninformationen anzeigen
  backup = false,               -- Keine Backup-Dateien
  swapfile = false,             -- Keine Swap-Dateien
}

-- Setze die Optionen
for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd('syntax on')


