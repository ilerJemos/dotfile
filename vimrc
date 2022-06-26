let mapleader=","

" set filetype
set background=dark
syntax enable
filetype plugin indent on

" colorscheme desert      " colorscheme desert

set nocompatible
" set encoding=utf-8
" set mouse=a
" set cursorline
set number
" set relativenumber
" set ruler
set hidden
" set clipboard=unnamedplus
set nobackup
set nowrap

" indent
set autoindent
set smartindent

" whitespace
" set formatoptions=tcqrn1
" set textwidth=79
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" Cursor motion
set scrolloff=3
" set backspace=indent,eol,start
set matchpairs+=<:>
" runtime! macros/matchit.vim

" Rendering
" set ttyfast

"search
" nnoremap / /\v
" vnoremap / /\v
set incsearch
set ignorecase
set smartcase
set showmatch
" set nohlsearch
" map <leader><space> :let @/=''<cr> " clear search


" auto dir
set autoshelldir
set autochdir

" color schema
" set termguicolors

" status bar
" set laststatus=2

" Last line
set showmode
set showcmd

" Visualize tabs and newlines
" set listchars=tab:▸\ ,eol:¬
" map <leader>l :set list!<CR> " Toggle tabs and EOL
    


" Maping-----------------------------------------------------------------------
nnoremap <leader>e :15Lex<cr>

" Move up/down editor lines
" nnoremap j gj
" nnoremap k gk

nnoremap <leader>w :w<cr>
nnoremap <F5> :so %<cr>

" window switch
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <silent> <S-H> :bprevious<CR>
nnoremap <silent> <S-L> :bnext<CR>

" Sudo to write
cnoremap w!! w !sudo tee % > /dev/null

" Macro------------------------------------------------------------------------
" set reg 'h'
" let @h='ahelloworld'

" Autocmd----------------------------------------------------------------------------
"autocmd FileType text,markdown,tex setlocal textwidth=8
if has("autocmd")
    " delete last blank space
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Func----------------------------------------------------------------------------
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

nnoremap <F8> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	exec '!g++ % -o %<'
	exec '!time ./%<'
endfunc

nnoremap <F7> :call Term()<CR>
func Term()
	exec 'terminal'
endfunc

" packadd termdebug
nnoremap <F12> :call GDB()<CR>
func GDB()
	exec 'Termdebug %'
endfunc

autocmd InsertLeave * :silent !fcitx5-remote -c 
autocmd BufCreate *  :silent !fcitx5-remote -c 
autocmd BufEnter *  :silent !fcitx5-remote -c 
autocmd BufLeave *  :silent !fcitx5-remote -c
