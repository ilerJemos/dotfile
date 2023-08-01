-- run current line as a bash input
vim.keymap.set("n", "Q", "!!$SHELL<CR>")

-- disable <-
vim.keymap.set({ "n", "i", "v" }, "<Left>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Right>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Up>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Down>", "<Nop>")

-- buffer next/pre
vim.keymap.set("n", "<S-l>", "<Cmd>bnext<CR>")
vim.keymap.set("n", "<S-h>", "<Cmd>bprevious<CR>")
vim.keymap.set("n", "<leader>x", "<Cmd>bd<CR>")

-- tab next/pre
vim.keymap.set("n", "<M-l>", "<Cmd>tabnext<CR>")
vim.keymap.set("n", "<M-h>", "<Cmd>bprevious<CR>")

-- Term
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l")
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>")

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
-- vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
--
-- V
vim.keymap.set("v", "J", "<Cmd>m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", "<Cmd>m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-s>", "<CMD>w<CR>")
-- vim.keymap.set({ "v", "n" }, "<leader>y", "\"+y")
