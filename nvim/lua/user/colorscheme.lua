vim.g.gruvbox_material_background = "medium" -- soft medium hard
vim.cmd([[
try
  colorscheme gruvbox-material
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
endtry
]])
