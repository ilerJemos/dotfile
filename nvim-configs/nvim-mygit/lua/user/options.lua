local exec = vim.api.nvim_exec -- execute Vimscript
local opt = vim.opt -- global options
local cmd = vim.cmd -- execute Vim commands
-- local fn    = vim.fn            -- call Vim functions
-- local g     = vim.g                 -- global variables
-- local b     = vim.bo            -- buffer-scoped options
-- local w     = vim.wo            -- windows-scoped options

vim.g.mapleader = ","
vim.g.maplocalleader = ","

opt.termguicolors = true -- Enable GUI colors for the terminal to get truecolor
opt.undofile = true
opt.clipboard = opt.clipboard + "unnamedplus" -- copy & paste
opt.wrap = false -- don't automatically wrap on load
opt.showmatch = true -- show the matching part of the pair for [] {} and ()
opt.cursorline = true -- highlight current line
opt.number = true -- show line numbers
opt.incsearch = true -- incremental search
opt.hlsearch = true -- highlighted search results
opt.ignorecase = true -- ignore case sensetive while searching
opt.smartcase = true
opt.scrolloff = 1 -- when scrolling, keep cursor 1 lines away from screen border
opt.sidescrolloff = 2 -- keep 30 columns visible left and right of the cursor at all times
opt.backspace = "indent,start,eol" -- make backspace behave like normal again
opt.mouse = "a" -- turn on mouse interaction
opt.updatetime = 500 -- CursorHold interval
opt.expandtab = true
opt.softtabstop = 2
opt.shiftwidth = 2 -- spaces per tab (when shifting), when using the >> or << commands, shift lines by 4 spaces
opt.tabstop = 2 -- spaces per tab
opt.smarttab = true -- <tab>/<BS> indent/dedent in leading whitespace
opt.autoindent = true -- maintain indent of current line
opt.shiftround = true
opt.splitbelow = true -- open horizontal splits below current window
opt.splitright = true -- open vertical splits to the right of the current window
opt.laststatus = 3 -- always show status line
opt.colorcolumn = "79" -- vertical word limit line
opt.showtabline = 1 -- always show tabs
opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
opt.fileencoding = "utf-8" -- the encoding written to a fileset.cmdheight = 2, more space in the neovim command line for displaying messages
-- set.conceallevel = 0                       -- so that `` is visible in markdown files
opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
-- set.pumheight = 10                          -- pop up menu height
-- vim.opt.shortmess:append "c"
-- vim.cmd "set whichwrap+=<,>,[,],h,l"

opt.hidden = true -- allows you to hide buffers with unsaved changes without being prompted
opt.inccommand = "split" -- live preview of :s results set seeet
opt.shell = "zsh" -- shell to use for `!`, `:!`, `system()` etc.
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
opt.wildignore = opt.wildignore + "*.o,*.rej,*.so"
-- remove whitespace on save
cmd([[au BufWritePre * :%s/\s\+$//e]])
-- faster scrolling
opt.lazyredraw = true
-- don't auto commenting new lines
cmd([[au BufEnter * set fo-=c fo-=r fo-=o]])
-- completion options
opt.completeopt = "menuone,noselect,noinsert"

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
