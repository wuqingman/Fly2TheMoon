" 语法高亮
syntax enable
" 文件与插件、缩进检测
filetype plugin indent on



" 配置文件修改之后自动加载
autocmd! BufWritePost $F2TM_project_path/vim/vim/scripts/*.vim,$F2TM_project_path/vim/vimrc execute 'source %'
" 退出插入模式时使用相对行号,关闭粘贴模式
autocmd! InsertLeave * :set nopaste
" 离开插入模式后自动关闭预览窗口
autocmd! InsertLeave * if pumvisible() == 0|pclose|endif
" 打开文件时光标自动定位到上次的位置
autocmd! BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" 在gitcommit中竖线72个字符，符合git commit的规范
" 不再定位到上次的位置，每次都从文件头开始编辑
function! <SID>GitCommitEditMsg()
    :set colorcolumn=72
    exec "normal! gg"
endfunction
autocmd! BufReadPost COMMIT_EDITMSG :call <SID>GitCommitEditMsg()

" 高亮关键词
if v:version > 701
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
endif



" 重新定义高亮方案名
" 防止错误整行标红导致看不清
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline



" 补全上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

" 关闭方向键, 强迫自己用 hjkl
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>

" 分屏窗口移动
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" 快速翻页
nnoremap <C-u> <PageUp>H
nnoremap <C-d> <PageDown>H

" 快速到行首行尾
nnoremap J ^
vnoremap J ^
nnoremap K $
vnoremap K $


" 命令行模式增强, <C-a>行首, <C-e>行尾
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" tab操作
nnoremap <C-n> <Esc>:tabnext<CR>
nnoremap <C-p> <Esc>:tabprev<CR>
nnoremap <C-t> <Esc>:tabnew<CR>
nnoremap <Leader><C-t> <Esc>:tabnew#<CR>

nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
nnoremap <Leader>9 :tabnew<Space>$HOME/.vim/scripts/plugin.vim<CR>:vsp<Space>$HOME/.vim/scripts/setting.vim<CR>
nnoremap <Leader>0 :tab<Space>h<CR>

" 快速关闭
function! <SID>CloseTabOrCloseVim()
    let page_num_in_vim = tabpagenr("$")
    if page_num_in_vim == 1
        :qa
    else
        :tabc
    endif
endfunction
nnoremap <Leader>q :call <SID>CloseTabOrCloseVim()<CR>
nnoremap qq :q<CR>

" 记录上一个tab的编号,方便快速切换回去
let g:last_active_tab = 1
autocmd! TabLeave * let g:last_active_tab = tabpagenr()
nnoremap <silent> <Leader>t :execute 'tabnext ' . g:last_active_tab<cr>

" 调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv

" 保存
cmap w!! w !sudo tee >/dev/null %
nnoremap <silent> <C-s> :w<CR>
inoremap <silent> <C-s> <Esc>:w<CR>

" 去掉搜索高亮
noremap <Leader>fq :nohls<CR>
" 设置粘贴模式
noremap <Leader>fw :set paste<ESC>i


" 配色
colorscheme PaperColor
" 暗色背景色
set background=dark
" 突出显示当前行
set cursorline
highlight CursorLine term=underline cterm=underline
" 显示竖线,防止代码超过最大文本长度
set colorcolumn=120

" 不使用vi兼容模式
set nocompatible
" history存储容量
set history=10000
" 文件修改之后自动载入。
set autoread
" 启动的时候不显示那个援助索马里儿童的提示
set shortmess=I
" 命令行补全忽略部分文件
set wildignore=*.swp,*.bak,*.py[o,c],*.class,.svn,*.o,*~,.git
" 命令行补全模式
set wildmenu
" 不启用鼠标
set mouse=
" 显示当前的行号列号：
set ruler
" 在状态栏显示正在输入的命令
set showcmd
" 左下角显示当前vim模式
set showmode
" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=0
" 命令行（在状态行下）的高度，默认为1，这里是2
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
" 底部状态栏显示2行
set laststatus=2
" 括号配对情况,跳转并高亮一下匹配的括号
set showmatch
" 2s后闪缩匹配的括号
set matchtime=1
" 搜索高亮
set hlsearch
" 打开增量搜索模式,随着键入即时搜索
set incsearch
" 搜索时忽略大小写
set ignorecase
" 有一个或以上大写字母时仍大小写敏感
set smartcase
" 关闭代码折叠
set nofoldenable
" 如果启用代码折叠功能，则按照缩进折叠
set foldmethod=indent
" 最大折叠数
set foldnestmax=2
" 折叠标识
set foldcolumn=1
" C语言缩进方式
set cindent
" 自动缩进
set autoindent
" 智能缩进
set smartindent
" tab宽度
set tabstop=4
" 缩进的空格数
set shiftwidth=4
" 退格删除的空格数
set softtabstop=4
" 智能tab
set smarttab
" tab转空格
set expandtab
" 缩进取整
set shiftround
" 设置行号
set number
" 设置新文件的编码为 UTF-8
set encoding=utf-8
" 自动判断编码时，依次尝试以下编码：
set fileencodings=utf-8,cp936
" 优先使用unix格式
set fileformats=unix,mac,dos
" 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
set completeopt=longest,menu
" 终端256色
set t_Co=256
" 不要备份文件
set nobackup
" 不要交换文件
set noswapfile
" 退格键在插入模式中的的使用范围
set backspace=indent,eol,start
" 总是显示标签页
set showtabline=2
" 分屏时新面板的位置
set splitright
set splitbelow
" 增加undo文件
set undodir=~/.vim/sessions
set undofile
