set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle {
    " 插件管理
    Plugin 'VundleVim/Vundle.vim'
" }


" Color {
    " 配色
    Plugin 'NLKNguyen/papercolor-theme'

    " 加入rtp，否则会找不到
    " 很奇怪在这一段附近rtp中并没有各个plugin的目录，只有Vundle.vim目录
    " 可以在colorscheme语句前后加入set rtp来查看
    set rtp+=~/.vim/bundle/papercolor-theme
    colorscheme PaperColor
" }


" delimitMate {
    " 引号补全
    Plugin 'Raimondi/delimitMate'

    " python中的三引号注释使用"
    au FileType python let b:delimitMate_nesting_quotes = ['"']
    au FileType markdown let b:delimitMate_nesting_quotes = ['`']
" }


" trailing-whitespace {
    " 去除行尾空格
    Plugin 'bronson/vim-trailing-whitespace'

    "保存前删除多余空格
    fun! <SID>StripTrailingWhitespaces()
        let l = line(".")
        let c = col(".")
        %s/\s\+$//e
        call cursor(l, c)
    endfun
    autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
" }


" easymotion {
    " 快速定位
    Plugin 'Lokaltog/vim-easymotion'

    let g:EasyMotion_smartcase = 1
    let g:EasyMotion_startofline = 0
    nnoremap <Leader><Leader>j <Plug>(easymotion-j)
    nnoremap <Leader><Leader>k <Plug>(easymotion-k)
    nnoremap <Leader><Leader>h <Plug>(easymotion-linebackward)
    nnoremap <Leader><Leader>l <Plug>(easymotion-lineforward)
    nnoremap <Leader><Leader>. <Plug>(easymotion-repeat)
" }


" signature {
    " 快速标记
    Plugin 'kshenoy/vim-signature'
" }


" airline {
    " 状态栏增强
    Plugin 'vim-airline/vim-airline'
    " 主题包
    Plugin 'vim-airline/vim-airline-themes'

    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    " 这个主题在papercolor-theme下面，在Color部分加过rtp了
    let g:airline_theme = 'PaperColor'
    let g:airline_left_sep = '▶'
    let g:airline_left_alt_sep = '❯'
    let g:airline_right_sep = '◀'
    let g:airline_right_alt_sep = '❮'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.branch = '⎇'
    let g:airline_powerline_fonts = 0
    let g:airline#extensions#tabline#enabled = 0
    let g:airline#extensions#ctrlp#color_template = 'insert'
    let g:airline#extensions#ctrlp#color_template = 'normal'
    let g:airline#extensions#ctrlp#color_template = 'visual'
    let g:airline#extensions#ctrlp#color_template = 'replace'
    let g:airline#extensions#ctrlp#show_adjacent_modes = 1
" }


" rainbow_parentheses {
    " 括号显示增强
    Plugin 'kien/rainbow_parentheses.vim'

    let g:rbpt_colorpairs = [
        \ ['brown',       'RoyalBlue3'],
        \ ['Darkblue',    'SeaGreen3'],
        \ ['darkgray',    'DarkOrchid3'],
        \ ['darkgreen',   'firebrick3'],
        \ ['darkcyan',    'RoyalBlue3'],
        \ ['darkred',     'SeaGreen3'],
        \ ['darkmagenta', 'DarkOrchid3'],
        \ ['brown',       'firebrick3'],
        \ ['gray',        'RoyalBlue3'],
        \ ['darkmagenta', 'DarkOrchid3'],
        \ ['Darkblue',    'firebrick3'],
        \ ['darkgreen',   'RoyalBlue3'],
        \ ['darkcyan',    'SeaGreen3'],
        \ ['darkred',     'DarkOrchid3'],
        \ ['red',         'firebrick3'],
        \ ]
    let g:rbpt_max = 16
    let g:rbpt_loadcmd_toggle = 0
    autocmd Syntax * RainbowParenthesesLoadRound
    autocmd Syntax * RainbowParenthesesLoadSquare
    autocmd Syntax * RainbowParenthesesLoadBraces
    autocmd Syntax * RainbowParenthesesLoadChevrons
    autocmd VimEnter,BufRead,BufNewFile * RainbowParenthesesToggle
" }


" YouCompleteMe {
    " 代码自动补全
    Plugin 'Valloric/YouCompleteMe'

    let g:ycm_key_list_select_completion = ['<c-n>']
    let g:ycm_key_list_previous_completion = ['<c-p>']
    " 在注释输入中也能补全
    let g:ycm_complete_in_comments = 1
    " 在字符串输入中也能补全
    let g:ycm_complete_in_strings = 1
    " 提示UltiSnips
    let g:ycm_use_ultisnips_completer = 1
    " 注释和字符串中的文字也会被收入补全
    let g:ycm_collect_identifiers_from_comments_and_strings = 1
    " tags文件中的文字也会被收入补全
    let g:ycm_collect_identifiers_from_tags_files = 1
    " buffer使用垂直分割打开
    let g:ycm_goto_buffer_command = 'new-or-existing-tab'
    " 指定jedi的Python解释器路径，防止虚拟环境问题
    let g:ycm_server_python_interpreter = '/usr/bin/python'
    " 服务器持续记录日志
    let g:ycm_server_keep_logfiles = 0
    " 直接触发自动补全 insert模式下
    let g:ycm_key_invoke_completion = '<C-Enter>'
    " 载入第三方包
    let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
    " 黑名单,不启用
    let g:ycm_filetype_blacklist = {
        \ 'tagbar': 1,
        \ 'gitcommit': 1,
        \ 'notes': 1,
        \ 'text': 1,
        \ 'vimwiki': 1,
        \ 'vim': 1,
        \}
    nnoremap <Leader>fa :YcmCompleter GoToDefinitionElseDeclaration<CR>
    nnoremap <Leader>fs :YcmCompleter GoToDeclaration<CR>
" }


" session {
    " 会话管理
    Plugin 'xolox/vim-session'
    " session插件的依赖
    Plugin 'xolox/vim-misc'

    let g:session_autosave = 'yes'
    let g:session_autoload = 'no'
    nnoremap <Leader>fz :OpenSession<Space>
    nnoremap <Leader>fx :SaveSession<Space>
    nnoremap <Leader>fc :CloseSession<CR>
" }


" syntastic {
    " 多语言语法检查
    Plugin 'scrooloose/syntastic'

    let g:syntastic_error_symbol = '>>'
    let g:syntastic_warning_symbol = '>'
    " 打开文件时检查
    let g:syntastic_check_on_open = 1
    " 保存文件时检查
    let g:syntastic_check_on_wq = 1
    " 自动弹出错误列表
    let g:syntastic_auto_loc_list = 0
    " 语法高亮
    let g:syntastic_enable_highlighting = 1
    " python的语法检查器
    let g:syntastic_python_checkers = ['flake8', 'pep8', 'pyflakes', 'python']
    " 语法检查器的参数，可配置忽略某些检查
    let g:syntastic_python_flake8_args = '--max-line-length=120 --ignore=""'
    let g:syntastic_python_pep8_args = '--max-line-length=120 --ignore=""'
" }


" ultisnips {
    " 代码补全
    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets'

    let g:UltiSnipsExpandTrigger = "<tab>"
    let g:UltiSnipsJumpForwardTrigger = "<tab>"
    let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
    let g:UltiSnipsSnippetDirectories = ['UltiSnips', 'snips']
    let g:UltiSnipsSnippetsDir = '~/.vim/snips'
    " ctrl+j/k 进行选择
    func! g:JInYCM()
        if pumvisible()
            return "\<C-n>"
        else
            return "\<c-j>"
        endif
    endfunction
    func! g:KInYCM()
        if pumvisible()
            return "\<C-p>"
        else
            return "\<c-k>"
        endif
    endfunction
    inoremap <C-j> <C-r>=g:JInYCM()<CR>
    au BufEnter,BufRead * exec "inoremap <silent> " . g:UltiSnipsJumpBackwordTrigger . " <C-R>=g:KInYCM()<CR>"
    let g:UltiSnipsJumpBackwordTrigger = "<C-k>"
" }


" ctrlp {
    " 文件搜索
    Plugin 'ctrlpvim/ctrlp.vim'
    " ctrlp插件 - 不用ctag进行函数快速跳转
    Plugin 'tacahiroy/ctrlp-funky'

    let g:ctrlp_map = '<Leader>d'
    " 直接写死使用项目目录
    let g:ctrlp_cmd = 'CtrlP /work/mapboom/'
    let g:ctrlp_custom_ignore = {
        \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
        \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
        \ }
    let g:ctrlp_working_path_mode=0
    let g:ctrlp_match_window_bottom=1
    let g:ctrlp_max_height=15
    let g:ctrlp_match_window_reversed=0
    " mru模式存储的历史数
    let g:ctrlp_mruf_max=1000
    let g:ctrlp_follow_symlinks=1
    " 强制使用缓存，加速显示文件列表
    let g:ctrlp_use_caching = 1
    " 如果安装了ag, 使用ag
    if executable('ag')
        let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    endif
    nnoremap <Leader>fd :CtrlP<SPACE>
    nnoremap <Leader>ff :CtrlPMRU<CR>
    nnoremap <Leader>fb :CtrlPBuffer<CR>

    let g:ctrlp_funky_syntax_highlight = 1
    let g:ctrlp_funky_after_jump = 'zt'
    let g:ctrlp_funky_sort_by_mru = 1
    let g:ctrlp_funky_use_cache = 1
    let g:ctrlp_extensions = ['funky']
    nnoremap <Leader>fu :CtrlPFunky<CR>
    nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<CR>
" }


" surround {
    " 快速加入修改环绕字符
    Plugin 'tpope/vim-surround'
" }


" multiple-cursors {
    " 多光标选中编辑
    Plugin 'terryma/vim-multiple-cursors'

    let g:multi_cursor_use_default_mapping=0
    let g:multi_cursor_next_key='<C-m>'
    let g:multi_cursor_prev_key='<C-p>'
    let g:multi_cursor_skip_key='<C-x>'
    let g:multi_cursor_quit_key='<Esc>'
" }


" taboo {
    " 标签重命名
    Plugin 'gcmt/taboo.vim'

    nnoremap <Leader>ft :TabooRename<space>
" }


" nerdcommenter {
    " 快速注释
    Plugin 'scrooloose/nerdcommenter'
" }


" nerdtree {
    Plugin 'scrooloose/nerdtree'
    " 所有tab共享一个nerdtree
    Plugin 'jistr/vim-nerdtree-tabs'
    " nerdtree中显示git信息
    Plugin 'XuYuanp/nerdtree-git-plugin'

    " 高亮行，但是在这个配色下好像无效
    let NERDTreeHighlightCursorline=1
    " 以下文件不启用nerdtree
    let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
    " 键盘映射
    let g:NERDTreeMapOpenSplit = 's'
    let g:NERDTreeMapOpenVSplit = 'v'

    map <Leader>fn :NERDTreeTabsToggle<CR>
    map <Leader>fm :NERDTreeFind<CR>
    " 终端启动vim时自动启动nerdtree
    let g:nerdtree_tabs_open_on_console_startup=0
    let g:nerdtree_tabs_open_on_gui_startup=0
    " 关闭同步
    let g:nerdtree_tabs_synchronize_view=0
    let g:nerdtree_tabs_synchronize_focus=0
    " 不重命名tab
    let g:nerdtree_tabs_meaningful_tab_names=0
    " 在nerdtree中自动定位当前文件的位置
    let g:nerdtree_tabs_autofind=1
    " 切换tab时强制聚焦在文件窗口上而不是nerdtree上
    let g:nerdtree_tabs_focus_on_files = 1
" }

" gitgutter {
    Plugin 'airblade/vim-gitgutter'

    set updatetime=250
    let g:gitgutter_map_keys = 0
    let g:gitgutter_enabled = 0
    let g:gitgutter_highlight_lines = 1
    nnoremap <leader>fg :GitGutterToggle<CR>
" }

" vimcdoc {
    Plugin 'vimcn/vimcdoc'
    set helplang=cn
" }

call vundle#end()
filetype plugin indent on
