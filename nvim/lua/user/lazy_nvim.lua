local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",     -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {
  install = {
    colorscheme = { "tokyonight", "gruvbox" },
  }
}

require('lazy').setup({
  require("user.plugins.treesitter"),
  require("user.plugins.telescope"),
  require("user.plugins.colorscheme"),
  require("user.plugins.ui"),
  require("user.plugins.utils"),
  require("user.plugins.lsp"),
  require("user.plugins.cmp"),
  require("user.plugins.debug"),
  --require("user.plugins."),
  --
})
