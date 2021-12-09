" -----------------------------------------------------------
" source ~/.vim_runtime/vimrcs/basic.vim
" try
"   source ~/.vim_runtime/my_configs.vim
" catch
" endtry
"

filetype plugin indent on
syntax enable on

set showcmd
set number
set relativenumber
set autoindent
set smartindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set scrolloff=8
set mouse=a
set expandtab
set incsearch
set nohlsearch
set ignorecase
set smartcase
set showmatch
set termguicolors
set splitbelow
set splitright
set noshowmode
set nowrap
set noswapfile
set nobackup
set undofile
set undodir=~/.config/nvim/undodir
set hidden
" set autochdir
set autoread
set autowrite
set cursorline
set ruler
" set path+=**
" -----------------------------FOLD--------------------------------------------
" set foldenable " 开始折叠
" set foldmethod=syntax " 设置语法折叠
" set foldcolumn=0 " 设置折叠区域的宽度
" setlocal foldlevel=1 " 设置折叠层数为 1
" nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR> " 用空格键来开关折叠
" -----------------------------------------------------------------------------

" Maping-----------------------------------------------------------------------
let mapleader=','

inoremap jj <ESC>`^
nnoremap <leader>w :w<cr>
nnoremap <leader><F5> :so %<cr>

" window switch
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

" nnoremap <silent> [b :bprevious<CR>
" nnoremap <silent> [n :bnext<CR>

" Sudo to write
cnoremap w!! w !sudo tee % > /dev/null

" Macro------------------------------------------------------------------------
let @h='ahelloworld'
" -----------------------------------------------------------------------------
" autocmd
if has("autocmd")
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" -----------------------------------------------------------------------------
call plug#begin('~/.vim/plugged/')

Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline' " status bar
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine' " indent line
Plug 'gruvbox-community/gruvbox'
Plug 'scrooloose/nerdtree' " file tree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'luochen1990/rainbow' " rainbow bracks
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
Plug 'Raimondi/delimitMate'  " 括号补全

"Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Plug 'xuyuanp/nerdtree-git-plugin'
"Telesocpe
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
"Lsp
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
" Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Autocompletion
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'onsails/lspkind-nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'


Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-commentary' "注释
Plug 'chiel92/vim-autoformat'
call plug#end()

" lua require('luailer')

" -----------------------------------------------------------
"  look - { theme,airline }
colorscheme gruvbox
set background=dark
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" -----------------------------------------------------------
" nerdtree
"
nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>
" -----------------------------------------------------------
""" instant_markdown
" let g:instant_markdown_slow = 1
let g:instant_markdown_autostart=0
let g:mkdp_auto_close = 1
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
" let g:instant_markdown_allow_external_content = 0
"let g:instant_markdown_mathjax = 1
"let g:instant_markdown_mermaid = 1
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
let g:instant_markdown_autoscroll=0
"let g:instant_markdown_port = 8888
"let g:instant_markdown_python = 1
nnoremap <leader><F3> :InstantMarkdownPreview<CR>
let g:instant_markdown_browser = "firefox --new-window"
" -----------------------------------------------------------
"  Telesocpe
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fr <cmd>Telescope oldfiles<cr>

" -----------------------------------------------------------
"  Lspconfig
"  https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
lua << EOF

local lspconfig = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

-- Enable completion triggered by <c-x><c-o>
buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

-- Mappings.
local opts = { noremap=true, silent=true }

-- See `:help vim.lsp.*` for documentation on any of the below functions
buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- local lspconfig = require('lspconfig')
local lspkind = require('lspkind')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'clangd', 'pyright', 'tsserver','dockerls','vimls','jsonls','gopls'}
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = {
            debounce_text_changes = 150,
            },
        }
end

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
    snippet = {
        expand = function(args)
        require('luasnip').lsp_expand(args.body)
    end,
    },
-- formating = {
    --     format = lspkind.cmp_format()
    -- },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
            },
        ['<Tab>'] = function(fallback)
        if cmp.visible() then
            cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
        else
            fallback()
        end
    end,
    ['<S-Tab>'] = function(fallback)
    if cmp.visible() then
        cmp.select_prev_item()
    elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
    else
        fallback()
    end
end,
},
sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    },
}
EOF
" ----------------------------------
lua <<EOF
require'nvim-treesitter.configs'.setup {
    highlight ={
enable = true;
}
}
EOF
" ----------------------------------
" easymotion
nmap ss <Plug>(easymotion-s2)
" ----------------------------------
" tagbar
nmap <F8> :TagbarToggle<CR>
" ----------------------------------
" autoformat
noremap <F3> :Autoformat<CR>
" ----------------------------------
" rainbow
let g:rainbow_active = 1
" ----------------------------------
" ----------------------------------
" ----------------------------------
"  Func
func SetTitle()
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python")
        call setline(2, "\# -*- coding:utf-8 -*-")
        normal G
        normal o
        normal o
        call setline(5,"if __name__ == '__main__':")
        call setline(6,"pass")
    endif
endfunc
func! CompileRunGcc()
	exec "w"
	exec '!g++ % -o %<'
	exec '!time ./%<'
endfunc

nnoremap <F7> :call Term()<CR>
func! Term()
	exec 'terminal'
endfunc

packadd termdebug
nnoremap <F12> :call GDB()<CR>
func! GDB()
	exec 'Termdebug %'
endfunc
