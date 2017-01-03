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
nnoremap K $


" 命令行模式增强, <C-a>行首, <C-e>行尾
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" tab操作
nnoremap <C-n> <Esc>:tabnext<CR>
nnoremap <C-p> <Esc>:tabprev<CR>
nnoremap <C-t> <Esc>:tabnew<CR>
noremap <Leader><C-t> <Esc>:tabnew#<CR>

noremap <Leader>1 1gt
noremap <Leader>2 2gt
noremap <Leader>3 3gt
noremap <Leader>4 4gt
noremap <Leader>5 5gt

nnoremap <Leader>9 :tabnew<Space>$HOME/.vim/scripts/plugin.vim<CR>:vsp<Space>$HOME/.vim/scripts/setting.vim<CR>
nnoremap <Leader>0 :tab<Space>h<CR>

" 记录上一个tab的编号,方便快速切换回去
let g:last_active_tab = 1
autocmd TabLeave * let g:last_active_tab = tabpagenr()
nnoremap <silent> <Leader>t :execute 'tabnext ' . g:last_active_tab<cr>

" 调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv

" 使用sudo保存
cmap w!! w !sudo tee >/dev/null %

" 去掉搜索高亮
noremap <Leader>fq :nohls<CR>
" 设置粘贴模式
noremap <Leader>fw :set paste<ESC>i
