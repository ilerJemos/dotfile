local option = vim.opt
local buffer = vim.b
local global = vim.g

global.mapleader = " "
global.maplocalleader = " "

global.loaded_netrw = 1
global.loaded_netrwPlugin = 1


-- Indenting
option.expandtab = true
option.shiftwidth = 2
option.tabstop = 2
option.softtabstop = 2
option.shiftround = true
option.autoindent = true
option.smartindent = true

option.showmode = false
option.backspace = { "indent", "eol", "start" }

option.laststatus = 3
option.scrolloff = 3

-- Make line numbers default
option.number = true
option.relativenumber = true

option.wildmenu = true

-- Enable mouse mode
option.mouse = "a"

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
option.clipboard = "unnamedplus"

-- Enable break indent
option.breakindent = true

-- Save undo history
option.undofile = true
option.undodir = vim.fn.expand('$HOME/.local/share/nvim/undo')

-- Set highlight on search
option.hlsearch = false

-- Case-insensitive searching UNLESS \C or capital in search
option.ignorecase = true
option.smartcase = true

-- Decrease update time
option.updatetime = 250
option.timeoutlen = 300

-- Set completeopt to have a better completion experience
option.completeopt = { "menu", "menuone", "noselect" }

-- NOTE: You should make sure your terminal supports this
option.termguicolors = true

option.cursorline = true
option.signcolumn = "yes"
option.numberwidth = 3 -- always reserve 3 spaces for line number
option.synmaxcol = 300 -- default: 3000
option.wrap = false
option.mps:append("<:>")
option.clipboard:append("unnamedplus")

option.splitright = true
option.splitbelow = true
option.startofline = true
option.history = 1000

option.autoread = true
option.title = true
option.swapfile = false
option.backup = false
option.exrc = true


buffer.fileencodeing = "utf-8"
