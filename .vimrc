let mapleader=','

set nocompatible		" disable vi

filetype plugin indent on
syntax enable on

" set mouse=a				" open mouse support
set background=dark
set number				" 显示行号
set wildmenu             " 开启zsh支持
set wildmode=full        " zsh补全菜单
set autoread    " 自动加载改动的文件
set showmatch          " Show matching brackets.
set ignorecase         " Do case insensitive matching
set smartcase          " Do smart case matching
set incsearch          " Incremental search
set autowrite          " Automatically save before commands like :next and :make
set showcmd            " Show (partial) command in status line.
set autoindent
set smartindent " 开启新行时使用智能自动缩进
set hidden             " Hide buffers when they are abandoned
setlocal noswapfile " 不要生成swap文件
set bufhidden=hide " 当buffer被丢弃的时候隐藏它
" set relativenumber " 显示相对行号
set cursorline " 突出显示当前行
set ruler " 打开状态栏标尺
set shiftwidth=4 " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4 " 使得按退格键时可以一次删掉 4 个空格
set tabstop=4 " 设定 tab 长度为 4
set nobackup " 覆盖文件时不备份
set autochdir " 自动切换当前目录为当前文件所在的目录
set backupcopy=yes " 设置备份时的行为为覆盖
set hlsearch " 搜索时高亮显示被找到的文本
" set fillchars=vert:\ ,stl:\ ,stlnc:\ " 在分割窗口间留出空白
set noerrorbells " 关闭错误信息响铃
set novisualbell " 关闭使用可视响铃代替呼叫
set t_vb= " 置空错误铃声的终端代码
set matchtime=2 " 短暂跳转到匹配括号的时间
set magic " 设置魔术
set backspace=indent,eol,start " 不设定在插入状态无法用退格键和 Delete 键删除回车符
" set cmdheight=1 " 设定命令行的行数为 1
" set laststatus=2 " 显示状态栏 (默认值为 1, 无法显示状态栏)
" set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %c:%l/%L%)
" set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ Ln\ %l,\ Col\ %c/%L%) " 设置在状态行显示的信息
set pastetoggle=<F2> " F2 进入粘贴模式  set nopaste set paste

" -----------------------------FOLD--------------------------------------------
" set foldenable " 开始折叠
" set foldmethod=syntax " 设置语法折叠
" set foldcolumn=0 " 设置折叠区域的宽度
" setlocal foldlevel=1 " 设置折叠层数为 1
" nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR> " 用空格键来开关折叠
" -----------------------------------------------------------------------------


" MAP-----------------------------------------------------------------------
inoremap jj <ESC>`^
inoremap <leader>w <ESC>:w<cr>

noremap <leader>w :w<cr>

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> [n :bnext<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" json 格式化
com! FormatJSON %!python3 -m json.tool

" Sudo to write
cnoremap w!! w !sudo tee % > /dev/null

" -----------------------------------------------------------------------------
" inoremap (  ()<esc>i
" inoremap [  []<esc>i
" inoremap "  ""<esc>i
" inoremap '  ''<esc>i
" -----------------------------------------------------------------------------
" disable arrow keys
imap <UP> <Nop>
imap <DOWN> <Nop>
imap <LEFT> <Nop>
imap <RIGHT> <Nop>
" -----------------------------------------------------------------------------
nnoremap <F9> :call CompileRunGcc()<CR>
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
" -----------------------------------------------------------------------------

call plug#begin('~/.vim/plugged/')

" 启动界面
Plug 'mhinz/vim-startify'

" 状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" 缩进线条
Plug 'Yggdroot/indentLine'

" 主题
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'

" 目录树
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " 目录树美化

" 模糊搜索
Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" 跳转
Plug 'easymotion/vim-easymotion'

" 修改()""''
Plug 'tpope/vim-surround'

" 多文件替换
" Plug 'brooth/far.vim'

Plug 'fatih/vim-go' , { 'do': ':GoUpdateBinaries' }

" 代码浏览
Plug 'majutsushi/tagbar'
" 高亮
" Plug 'lfv89/vim-interestingwords'

" 代码补全
" deoplete
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" 代码格式化
" neoformat
Plug 'chiel92/vim-autoformat'

" 静态检查
" neomake
" Plug 'w0rp/ale'

" 注释
Plug 'tpope/vim-commentary'

" git
" Plug 'tpope/vim-fugitive'
" 显示变更
" Plug 'airblade/vim-gitgutter'
" 提交记录
" Plug 'junegunn/gv.vim'
" Plug 'xuyuanp/nerdtree-git-plugin'

" 括号补全
Plug 'Raimondi/delimitMate'

Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
Plug 'luochen1990/rainbow'

call plug#end()

" startify
" let g:startify_change_to_dir=0

" colorschema
colorscheme gruvbox

" nerdtree
"
nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
"let g:ctrlp_custom_ignore = {
"			\'dir': '\v[\/]\.(git|hg|svn)$'
"			\'file': '\v\.(exe|so|dll|swp|pyc|pyo)$'
"			\}

" easymotion
nmap ss <Plug>(easymotion-s2)

" surround
" cs ds ys

" vim-go
" autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

" tagbar
nmap <F8> :TagbarToggle<CR>

" autoformat
noremap <F3> :Autoformat<CR>


" rainbow
let g:rainbow_active = 1

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
