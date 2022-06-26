local exec = vim.api.nvim_exec -- execute Vimscript
local set = vim.opt -- global options
local cmd = vim.cmd -- execute Vim commands
-- local fn    = vim.fn            -- call Vim functions
-- local g     = vim.g                 -- global variables
-- local b     = vim.bo            -- buffer-scoped options
-- local w     = vim.wo            -- windows-scoped options

vim.g.mapleader = ","
vim.g.maplocalleader = ","

set.termguicolors = true -- Enable GUI colors for the terminal to get truecolor
set.undofile = true
set.clipboard = set.clipboard + "unnamedplus" -- copy & paste
set.wrap = true -- don't automatically wrap on load
set.showmatch = true -- show the matching part of the pair for [] {} and ()
set.cursorline = true -- highlight current line
set.number = true -- show line numbers
set.incsearch = true -- incremental search
set.hlsearch = true -- highlighted search results
set.ignorecase = true -- ignore case sensetive while searching
set.smartcase = true
set.scrolloff = 1 -- when scrolling, keep cursor 1 lines away from screen border
set.sidescrolloff = 2 -- keep 30 columns visible left and right of the cursor at all times
set.backspace = "indent,start,eol" -- make backspace behave like normal again
set.mouse = "a" -- turn on mouse interaction
set.updatetime = 500 -- CursorHold interval
set.expandtab = true
set.softtabstop = 2
set.shiftwidth = 2 -- spaces per tab (when shifting), when using the >> or << commands, shift lines by 4 spaces
set.tabstop = 2 -- spaces per tab
set.smarttab = true -- <tab>/<BS> indent/dedent in leading whitespace
set.autoindent = true -- maintain indent of current line
set.shiftround = true
set.splitbelow = true -- open horizontal splits below current window
set.splitright = true -- open vertical splits to the right of the current window
set.laststatus = 3 -- always show status line
-- set.colorcolumn = "79" -- vertical word limit line
set.showtabline = 1 -- always show tabs
set.showmode = false -- we don't need to see things like -- INSERT -- anymore
set.fileencoding = "utf-8" -- the encoding written to a fileset.cmdheight = 2,                           -- more space in the neovim command line for displaying messages
-- set.conceallevel = 0                       -- so that `` is visible in markdown files
set.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
set.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
-- set.pumheight = 10                          -- pop up menu height
-- vim.opt.shortmess:append "c"
-- vim.cmd "set whichwrap+=<,>,[,],h,l"

set.hidden = true -- allows you to hide buffers with unsaved changes without being prompted
set.inccommand = "split" -- live preview of :s results set seeet
set.shell = "zsh" -- shell to use for `!`, `:!`, `system()` etc.
-- highlight on yank
exec(
	[[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=500, on_visual=true}
  augroup end
]],
	false
)

-- jump to the last position when reopening a file
cmd([[
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif
]])

-- -- auto source vim
-- cmd([[
--   augroup neovim
-- 		autocmd!
-- 		autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
-- 	augroup end
-- ]])

-- patterns to ignore during file-navigation
set.wildignore = set.wildignore + "*.o,*.rej,*.so"
-- remove whitespace on save
cmd([[au BufWritePre * :%s/\s\+$//e]])
-- faster scrolling
set.lazyredraw = true
-- don't auto commenting new lines
cmd([[au BufEnter * set fo-=c fo-=r fo-=o]])
-- completion options
set.completeopt = "menuone,noselect,noinsert"

-- set markdown filytype default
cmd([[ autocmd BufNewFile,BufRead *.mdx set filetype=markdown ]])

-- 2 spaces for selected filetypes
cmd([[ autocmd FileType xml,html,xhtml,css,scssjavascript,lua,dart setlocal shiftwidth=2 tabstop=2 ]])
-- json
cmd([[ au BufEnter *.json set ai expandtab shiftwidth=2 tabstop=2 sta fo=croql ]])

--- latex
-- vim.g.tex_flavor = "latex"
-- cmd([[ autocmd FileType latex,tex,plaintex set wrap linebreak ]])
cmd([[ autocmd InsertLeave * :silent !fcitx5-remote -c ]])
cmd([[ autocmd BufCreate *  :silent !fcitx5-remote -c ]])
cmd([[ autocmd BufEnter *  :silent !fcitx5-remote -c ]])
cmd([[ autocmd BufLeave *  :silent !fcitx5-remote -c ]])
