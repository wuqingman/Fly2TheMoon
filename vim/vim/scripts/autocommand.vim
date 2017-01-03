" 配置文件修改之后自动加载
autocmd! bufwritepost $F2TM_project_path/vim/vim/scripts/*.vim,~/my_configure_files/vim/vimrc execute 'source %'
" 进入插入模式时使用绝对行号
autocmd InsertEnter * :set norelativenumber number
" 退出插入模式时使用相对行号,关闭粘贴模式
autocmd InsertLeave * :set relativenumber nonumber nopaste
" 离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" 打开文件时光标自动定位到上次的位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" 在yaml文件中不启用某些配置，会造成移动光标卡顿
autocmd FileType yaml set nocursorcolumn nocursorline norelativenumber nonumber

" 高亮关键词
if v:version > 701
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
endif
