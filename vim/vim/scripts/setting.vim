" --------------------------------------------------------------------------------
" | 目录
" |     0. 依赖
" |     1. 通用设置
" |         1.1 语法与通用类型
" |         1.2 搜索
" |         1.3 缩进
" |         1.4 折叠
" |         1.5 文件
" |         1.6 命令行
" |     2. 显示
" |         2.1 高亮
" |         2.2 配色方案
" |         2.3 行与光标
" |         2.4 状态栏
" |         2.5 杂项
" |     3. 快捷键
" |         3.1 导航
" |         3.2 标签
" |         3.3 窗口
" |         3.4 页面
" |         3.5 文件
" |         3.6 命令行
" |         3.7 杂项
" --------------------------------------------------------------------------------

" --------------------------------------------------------------------------------
" | 0. 依赖
" --------------------------------------------------------------------------------
" 判断标签是否为空
function! <SID>TabIsEmpty()
    return winnr('$') == 1 && len(expand('%')) == 0 && line2byte(line('$') + 1) <= 2
endfunction



" --------------------------------------------------------------------------------
" | 1. 通用配置
" --------------------------------------------------------------------------------

" 1.1 语法与通用类型
" {
    " 语法高亮
    syntax enable
    " 根据文件类型启用插件、缩进
    filetype plugin indent on

    " 类型：git commit
    " {
        " 设置竖线长度为72个字符，并移动光标到头部
        function! <SID>GitCommitEditMsg()
            :set colorcolumn=72
            exec "normal! gg"
        endfunction
        autocmd! BufReadPost COMMIT_EDITMSG :call <SID>GitCommitEditMsg()
    " }

    " 类型：vim配置文件
    " {
        " 自动载入配置
        autocmd! BufWritePost $F2TM_project_path/vim/vim/scripts/*.vim,$F2TM_project_path/vim/vimrc execute 'source %'

        " <Leader>9新标签打开配置文件
        function! <SID>OpenVimSettings()
            if <SID>TabIsEmpty()
                execute "edit $HOME/.vim/scripts/plugin.vim | vsp $HOME/.vim/scripts/setting.vim | tabmove"
            else
                execute "tabe $HOME/.vim/scripts/plugin.vim | vsp $HOME/.vim/scripts/setting.vim | tabmove"
            endif
            if exists(":TabooRename")
                execute "TabooRename settings"
            endif
        endfunction
        nnoremap <Leader>9 :call <SID>OpenVimSettings()<CR>
    " }

    " 类型：help信息
    " {
        " <Leader>0新标签打开帮助信息
        function! <SID>OpenVimHelp()
            if <SID>TabIsEmpty()
                execute "help | only | tabmove"
            else
                execute "tab help | tabmove"
            endif
            if exists(":TabooRename")
                execute "TabooRename help info"
            endif
        endfunction
        nnoremap <Leader>0 :call <SID>OpenVimHelp()<CR>
    " }
" }

" 1.2 搜索
" {
    " 搜索高亮
    set hlsearch
    " 手动去掉搜索高亮
    noremap <Leader>fq :nohls<CR>
    " 打开增量搜索模式,随着键入即时搜索
    set incsearch
    " 搜索时忽略大小写
    set ignorecase
    " 有大写字母时仍大小写敏感
    set smartcase
    " 搜索到文件尾后重新从头开始搜索
    set wrapscan
    " 退格删除的空格数
    set softtabstop=4
    " 智能tab
    set smarttab
    " tab转空格
    set expandtab
    " 缩进取整
    set shiftround
" }

" 1.3 缩进
" {
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
" }

" 1.4 折叠
" {
    " 关闭代码折叠
    set nofoldenable
    " 如果启用代码折叠功能，则按照缩进折叠
    set foldmethod=indent
    " 最大折叠数
    set foldnestmax=2
    " 折叠标识
    set foldcolumn=1
" }

" 1.5 文件
" {
    " 设置新文件的编码为 UTF-8
    set encoding=utf-8
    " 自动判断编码时，依次尝试以下编码：
    set fileencodings=utf-8,cp936
    " 优先使用unix格式
    set fileformat=unix
    set fileformats=unix,mac,dos

    " 文件修改之后自动载入。
    set autoread

    " 不要备份文件
    set nobackup
    " 不要交换文件
    set noswapfile

    " 使用undo文件来保存编辑历史，在重新打开文件后也可以撤销之前的修改
    set undodir=~/.vim/cache/undo
    set undofile
    set viminfo+=!

    " history存储容量
    set history=10000
" }

" 1.6 命令行
" {
    " 命令行补全
    set wildmenu
    set wildmode=longest,full
    set completeopt=menu,menuone,longest,preview
    set switchbuf=useopen,usetab

    " 命令行补全忽略部分文件
    set wildignore=*.o,*.obj,*~
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip
    set wildignore+=*DS_Store*
    set wildignore+=vendor/rails/**
    set wildignore+=vendor/cache/**
    set wildignore+=*.gem
    set wildignore+=log/**
    set wildignore+=tmp/**
    set wildignore+=*.png,*.jpg,*.gif
    set wildignore+=*.so,*.zip,*/.Trash/**,*.pdf,*.dmg,*/Library/**,*/.rbenv/**
    set wildignore+=*/.nx/**,*.app,*.git,.git
    set wildignore+=*.bak,*.py[o,c],*.class,.svn
" }


" 1.7 杂项
" {
    " 不使用vi兼容模式
    set nocompatible
    " 不启用鼠标
    set mouse=
    " 退格键在插入模式中的的使用范围
    set backspace=indent,eol,start
" }



" --------------------------------------------------------------------------------
" | 2. 显示
" --------------------------------------------------------------------------------

" 2.1 高亮
" {
    " 高亮关键词
    if v:version > 701
        autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
        autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
    endif

    " 重新定义高亮方案名，防止错误整行标红导致看不清
    highlight clear SpellBad
    highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
    highlight clear SpellCap
    highlight SpellCap term=underline cterm=underline
    highlight clear SpellRare
    highlight SpellRare term=underline cterm=underline
    highlight clear SpellLocal
    highlight SpellLocal term=underline cterm=underline
" }

" 2.2 配色方案
" {
    " 配色方案
    colorscheme PaperColor
    " 暗色背景
    set background=dark
" }

" 2.3 行与光标
" {
    " 光标
    " {
        " 打开文件时光标自动定位到上次的位置
        autocmd! BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

        " 括号配对情况,跳转并高亮一下匹配的括号
        set showmatch
        " 2s后闪缩匹配的括号
        set matchtime=1
    " }

    " 行信息
    " {
        " 显示行号
        set number
        " 显示相对行号
        set relativenumber

        " 进入插入模式时使用绝对行号
        autocmd! InsertEnter * :set norelativenumber number
        " 退出插入模式进入普通模式时使用相对行号
        autocmd! InsertLeave * :set relativenumber

        " F3 开启/关闭行号
        function! HideNumber()
            if(&relativenumber == &number)
                set relativenumber! number!
            elseif(&number)
                set number!
            else
                set relativenumber!
            endif
            set number?
        endfunc
        nnoremap <F3> :call HideNumber()<CR>

        " F4 快速切换相对行号
        function! NumberToggle()
            if(&relativenumber == 1)
                set norelativenumber number
            else
                set relativenumber
            endif
        endfunc
        nnoremap <F4> :call NumberToggle()<cr>

        " 突出显示当前行
        set cursorline
        highlight CursorLine term=underline cterm=underline
        " 显示竖线,防止代码超过最大文本长度
        set colorcolumn=120

        " 在上下移动光标时，光标的上方或下方至少会保留显示的行数
        set scrolloff=0
    " }
" }

" 2.4 状态栏
" {
    " 显示标尺信息：
    set ruler
    " 显示正在输入的命令
    set showcmd
    " 显示当前vim模式
    set showmode
    " 底部状态栏显示1行
    set laststatus=1
    " 更精简的提示信息
    set shortmess=aIO

" }

" 2.5 杂项
" {
    " 总是显示标签页
    set showtabline=2

    " 分屏时新面板的位置
    set splitright
    set splitbelow

    " 终端256色
    set t_Co=256
" }



" --------------------------------------------------------------------------------
" | 3. 快捷键
" --------------------------------------------------------------------------------

" 3.1 导航
" {
    " 关闭方向键，强迫自己用hjkl
    nnoremap <Left> <Nop>
    nnoremap <Right> <Nop>
    nnoremap <Up> <Nop>
    nnoremap <Down> <Nop>

    " 快速翻页
    nnoremap <C-u> <PageUp>H
    nnoremap <C-d> <PageDown>H
" }

" 3.2 标签
" {
    " 快速切换相邻标签
    nnoremap <C-n> <Esc>:tabnext<CR>
    nnoremap <C-p> <Esc>:tabprev<CR>
    " 快速新建空白标签
    nnoremap <C-t> <Esc>:tabnew<CR>

    " 快速跳转到指定标签
    nnoremap <Leader>1 1gt
    nnoremap <Leader>2 2gt
    nnoremap <Leader>3 3gt
    nnoremap <Leader>4 4gt
    nnoremap <Leader>5 5gt

    " 切换到最近使用的标签
    let g:last_active_tab = 1
    autocmd! TabLeave * let g:last_active_tab = tabpagenr()
    nnoremap <silent> <Leader>t :execute 'tabnext ' . g:last_active_tab<cr>
" }

" 3.3 窗口
" {
    " 不同窗口之间的移动
    nnoremap <C-j> <C-W>j
    nnoremap <C-k> <C-W>k
    nnoremap <C-h> <C-W>h
    nnoremap <C-l> <C-W>l
" }

" 3.4 页面
" {
    " 页面内光标快速移动
    " 移到最左侧
    nnoremap H ^
    vnoremap H ^
    " 移到最右侧
    nnoremap L $
    vnoremap L $
    " 移到最底部
    nnoremap J L
    vnoremap J L
    " 移到最顶端
    nnoremap K H
    vnoremap K H
" }

" 3.5 文件
" {
    " 没有写入权限时用sudo强制写入
    cmap w!! w !sudo tee >/dev/null %

    " 快速保存
    nnoremap <silent> <C-s> :w<CR>
    inoremap <silent> <C-s> <Esc>:w<CR>

    " 快速关闭窗口
    nnoremap <C-q> :q<CR>
    inoremap <C-q> <Esc>:q<CR>

    " 快速关闭标签
    function! <SID>CloseTabOrCloseVim()
        if tabpagenr("$") == 1
            execute "qa"
        else
            execute "tabc"
        endif
    endfunction
    nnoremap <Leader>q :call <SID>CloseTabOrCloseVim()<CR>
" }

" 3.6 命令行
" {
    " 命令行模式增强, <C-a>行首, <C-e>行尾
    cnoremap <C-j> <Down>
    cnoremap <C-k> <Up>
    cnoremap <C-a> <Home>
    cnoremap <C-e> <End>
" }

" 3.7 杂项
" {
    " 补全上下左右键的行为 会显示其他信息
    inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
    inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
    inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
    inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
    " 离开插入模式后自动关闭预览窗口
    autocmd! InsertLeave * if pumvisible() == 0|pclose|endif

    " 调整缩进后自动选中，方便再次操作
    vnoremap < <gv
    vnoremap > >gv

    " 手动进入粘贴模式
    noremap <Leader>fw :set paste<ESC>i
    " 退出插入模式时关闭粘贴模式
    autocmd! InsertLeave * :set nopaste

" }
