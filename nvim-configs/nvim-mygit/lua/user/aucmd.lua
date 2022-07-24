cmd = vim.cmd

-- Autocommand that reloads neovim whenever you save the plugins.lua file
cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])
