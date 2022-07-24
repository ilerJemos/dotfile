local keymap = require("user.utils").map

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>")
keymap("n", "<C-Down>", ":resize +2<CR>")
keymap("n", "<C-Left>", ":vertical resize -2<CR>")
keymap("n", "<C-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>")
keymap("n", "<S-h>", ":bprevious<CR>")

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi")
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi")

-- Temp
-- keymap("n", "<leader>e", "<Cmd>15 Lex<CR>")
keymap("n", "<leader>w", "<Cmd>w<CR>")

-- Insert --
-- Press jk fast to enter
-- keymap("i", "jk", "<ESC>")

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==")
keymap("v", "<A-k>", ":m .-2<CR>==")
keymap("v", "p", '"_dP')

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv")
keymap("x", "K", ":move '<-2<CR>gv-gv")
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv")
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv")

-- Terminal --
-- Better terminal navigation
-- local term_opts = { silent = true }
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
-- keymap("t", "<Esc>", "<C-\\><C-n>", term_opts)


keymap("n", "<F8>", "<Cmd>SymbolsOutline<CR>")
-- Temp
vim.keymap.set("n","<leader>s","<cmd>luafile $MYVIMRC<cr>",{noremap=true,silent=true})
vim.keymap.set("n","<leader>w","<cmd>w<cr>",{noremap=true,silent=true})

vim.keymap.set("n","<leader>p","<cmd>PackerSync<cr>",{noremap=true,silent=true})

vim.keymap.set("n","<leader>e","<cmd>NvimTreeFindFileToggle<cr>",{noremap=true,silent=true})

vim.keymap.set("n","<leader>ff","<cmd>Telescope find_files<cr>",{noremap=true,silent=true})
vim.keymap.set("n","<leader>fr","<cmd>Telescope oldfiles<cr>",{noremap=true,silent=true})
vim.keymap.set("n","<leader>fg","<cmd>Telescope live_grep<cr>",{noremap=true,silent=true})
vim.keymap.set("n","<leader>fb","<cmd>Telescope buffers<cr>",{noremap=true,silent=true})
vim.keymap.set("n","<leader>fh","<cmd>Telescope help_tags<cr>",{noremap=true,silent=true})

vim.keymap.set("t","<Esc>","<C-\\><C-n>",{noremap=true,silent=true})
