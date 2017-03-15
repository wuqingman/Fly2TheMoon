call plug#begin()


" vim-colorschemes {
    Plug 'flazz/vim-colorschemes'
" }


" Python {
    Plug 'hdima/python-syntax', {'for': ['python']}
    Plug 'hynek/vim-python-pep8-indent', {'for': ['python']}
    Plug 'Glench/Vim-Jinja2-Syntax', {'for': ['python']}
    " NOTICE: pip install isort
    Plug 'fisadev/vim-isort', {'for': ['python']}

    let g:vim_isort_map = '<C-i>'
" }


" nginx {
    Plug 'evanmiller/nginx-vim-syntax', {'for': ['nginx']}

    autocmd BufRead,BufNewFile */nginx/conf/conf.d/* set filetype=nginx
" }


" json & markdown {
    Plug 'elzr/vim-json', {'for': ['json']}
    Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown', {'for': ['markdown']}

    let g:vim_markdown_toc_autofit = 1
    let g:vim_markdown_json_frontmatter = 1
" }


" hyperfocus-writing {
"   无干扰写作
    Plug 'junegunn/limelight.vim', {'for': ['text', 'markdown']}
    Plug 'junegunn/goyo.vim', {'for': ['text', 'markdown']}
" }


" drawit {
"   画图
    Plug 'DrawIt', {'for': ['text', 'markdown']}
" }


" incsearch.vim {
"   搜索增强
    Plug 'haya14busa/incsearch.vim'
    Plug 'haya14busa/incsearch-fuzzy.vim'

    set hlsearch
    let g:incsearch#auto_nohlsearch = 1

    map /  <Plug>(incsearch-forward)
    map ?  <Plug>(incsearch-backward)
    map g/ <Plug>(incsearch-stay)

    map n  <Plug>(incsearch-nohl-n)
    map N  <Plug>(incsearch-nohl-N)
    map *  <Plug>(incsearch-nohl-*)
    map #  <Plug>(incsearch-nohl-#)
    map g* <Plug>(incsearch-nohl-g*)
    map g# <Plug>(incsearch-nohl-g#)

    map z/ <Plug>(incsearch-fuzzy-/)
    map z? <Plug>(incsearch-fuzzy-?)
    map zg/ <Plug>(incsearch-fuzzy-stay)
" }


" ctrlsf.vim {
"   文档搜索
    Plug 'dyng/ctrlsf.vim'

    let g:ctrlsf_position = 'right'
    let g:ctrlsf_winsize = '35%'
    let g:ctrlsf_default_root = '/work'
    let g:ctrlsf_auto_close = 0
    nmap <F5> <Plug>CtrlSFCwordPath<CR>
" }


" delimitMate {
"   引号补全
    Plug 'Raimondi/delimitMate'

    au FileType python let b:delimitMate_nesting_quotes = ["\"", "\'"]
    au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
" }


" trailing-whitespace {
"   去除行尾空格
    Plug 'bronson/vim-trailing-whitespace'

    let g:extra_whitespace_ignored_filetypes = ['ctrlsf']

    " 保存前删除多余空格
    function! <SID>StripTrailingWhitespaces()
        let l = line(".")
        let c = col(".")
        %s/\s\+$//e
        call cursor(l, c)
    endfunction
    autocmd! BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
" }


" easymotion {
"   快速跳转
    Plug 'Lokaltog/vim-easymotion'

    let g:EasyMotion_smartcase = 1
    let g:EasyMotion_startofline = 0
    map <Leader><Leader>j <Plug>(easymotion-j)
    map <Leader><Leader>k <Plug>(easymotion-k)
    map <Leader><Leader>h <Plug>(easymotion-linebackward)
    map <Leader><Leader>l <Plug>(easymotion-lineforward)
    map <Leader><Leader>. <Plug>(easymotion-repeat)
" }


" signature {
"   快速标记
    Plug 'kshenoy/vim-signature'
" }


" airline {
"   状态栏增强
    Plug 'vim-airline/vim-airline'

    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
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


" rainbow {
"   括号显示增强
    Plug 'luochen1990/rainbow'

    let g:rainbow_active = 1
" }


" YouCompleteMe {
"   代码自动补全
    Plug 'Valloric/YouCompleteMe', {'for': ['python']}

    let g:ycm_key_list_select_completion = ['<c-n>']
    let g:ycm_key_list_previous_completion = ['<c-p>']
    " Python路径
    let g:ycm_python_binary_path = 'python'
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
    " 服务器持续记录日志
    let g:ycm_server_keep_logfiles = 0
    " 直接触发自动补全 insert模式下
    let g:ycm_key_invoke_completion = '<C-Enter>'
    " 载入第三方包
    let g:ycm_global_ycm_extra_conf = "~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
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
"   会话管理
    Plug 'xolox/vim-session' | Plug 'xolox/vim-misc'

    let g:session_autosave = 'yes'
    let g:session_autoload = 'no'
    nnoremap <Leader>fz :OpenSession<Space>
    nnoremap <Leader>fx :SaveSession<Space>
    nnoremap <Leader>fc :CloseSession<CR>
" }


" ale {
"   语法检查
    Plug 'w0rp/ale'

    let g:ale_open_list = 0
    let g:ale_linters = {
    \   'python': ['flake8'],
    \ }
    let ale_python_flake8_args = '--max-line-length=120 --ignore="E402"'

    nmap <silent> <Leader>n <Plug>(ale_next_wrap)
    nmap <silent> <Leader>p <Plug>(ale_previous_wrap)
"


" ultisnips {
"   代码补全
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets', {'for': ['python']}

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
"   文件搜索
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'tacahiroy/ctrlp-funky'

    let g:ctrlp_map = '<Leader>d'
    let g:ctrlp_custom_ignore = {
        \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
        \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
        \ }
    let g:ctrlp_working_path_mode = 'ra'
    let g:ctrlp_match_window_bottom = 1
    let g:ctrlp_max_height = 15
    let g:ctrlp_match_window_reversed = 0
    let g:ctrlp_mruf_max = 1000
    let g:ctrlp_follow_symlinks = 1
    let g:ctrlp_use_caching  =  1
    " 如果安装了ag, 使用ag
    if executable('ag')
        let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    endif
    nnoremap <Leader>fd :CtrlP<SPACE>
    nnoremap <Leader>ff :CtrlPMRU<CR>
    nnoremap <Leader>fb :CtrlPBuffer<CR>

    let g:ctrlp_extensions = ['funky']
    " BUG: 取消语法高亮，否则ale会检查ctrlp面板中的代码
    let g:ctrlp_funky_syntax_highlight = 0
    let g:ctrlp_funky_after_jump = 'zt'
    let g:ctrlp_funky_sort_by_mru = 0
    let g:ctrlp_funky_use_cache = 1
    let g:ctrlp_funky_matchtype = 'path'
    let g:ctrlp_funky_nolim = 1
    nnoremap <Leader>fu :CtrlPFunky<CR>
    nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<CR>
" }


" surround {
"   快速引号修正
    Plug 'tpope/vim-surround' | Plug 'tpope/vim-repeat'
" }


" multiple-cursors {
"   多光标选中编辑
    Plug 'terryma/vim-multiple-cursors'

    let g:multi_cursor_use_default_mapping=0
    " BUG: 使用C-m会改动<CR>的映射，改成F区按键
    let g:multi_cursor_start_key='<F6>'
    let g:multi_cursor_next_key='<C-m>'
    let g:multi_cursor_prev_key='<C-p>'
    let g:multi_cursor_skip_key='<C-x>'
    let g:multi_cursor_quit_key='<Esc>'
" }


" vim-expand-region {
"   区域扩展
    Plug 'terryma/vim-expand-region'
" }


" taboo {
"   标签重命名
    Plug 'gcmt/taboo.vim'


    " 重命名前的标签格式
    let g:taboo_tab_format=" %N %f%m "
    " 重命名后的标签格式
    let g:taboo_renamed_tab_format=" %N.[%l%m] "
    " gui的标签跟terminal一致
    set guioptions-=e
    " 保存回话的时候保存标签名
    set sessionoptions+=tabpages,globals
    nnoremap <Leader>ft :TabooRename<space>
" }


" nerdcommenter {
"   快速注释
    Plug 'scrooloose/nerdcommenter'

    let g:NERDSpaceDelims = 1
    let g:NERDDefaultAlign = 'left'
    let g:NERDCommentEmptyLines = 1
    let g:NERDTrimTrailingWhitespace = 1
" }


" nerdtree {
"   目录树
    Plug 'scrooloose/nerdtree' | Plug 'jistr/vim-nerdtree-tabs' | Plug 'XuYuanp/nerdtree-git-plugin'

    " 在右侧
    let g:NERDTreeWinPos="left"
    " 打开文件后自动关闭
    let g:NERDTreeQuitOnOpen=1
    " 高亮行，但是在这个配色下好像无效
    let g:NERDTreeHighlightCursorline=1
    " 以下文件不启用nerdtree
    let g:NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
    " 键盘映射
    let g:NERDTreeMapOpenSplit = 's'
    let g:NERDTreeMapOpenVSplit = 'v'

    map <F1> :NERDTreeTabsToggle<CR>
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


" tagbar {
"   标签栏
    Plug 'majutsushi/tagbar', {'for': ['python', 'sh']}

    let g:tagbar_autoclose = 0
    let g:tagbar_compact = 0
    let g:tagbar_sort = 0
    let g:tagbar_map_nexttag = '<C-j>'
    let g:tagbar_map_prevtag = '<C-k>'
    nmap <F2> :TagbarToggle<CR>
    " autocmd FileType python nested :call tagbar#autoopen(0)
" }


" gitgutter {
"   git对比
    Plug 'airblade/vim-gitgutter'

    set updatetime=250
    let g:gitgutter_map_keys = 0
    let g:gitgutter_enabled = 0
    let g:gitgutter_highlight_lines = 1
    nnoremap <leader>fg :GitGutterToggle<CR>
" }


" vimcdoc {
"   vim中文文档
    Plug 'vimcn/vimcdoc', {'branch': 'release'}

    set helplang=cn
" }


call plug#end()
