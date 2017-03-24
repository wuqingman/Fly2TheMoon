#!/usr/bin/env bash

# 配置变量
f2tm_dir="$HOME/Fly2TheMoon"
backup_dir="$HOME/backup"
XDG_CONFIG_DIRS="$HOME/.config"

# 创建目录
if [ ! -d $backup_dir ]; then
    mkdir -p $backup_dir
fi
if [ ! -d $XDG_CONFIG_DIRS ]; then
    mkdir -p $XDG_CONFIG_DIRS
fi

# 备份已有的配置文件
file="
    $HOME/.gitconfig
    $HOME/.pip
    $HOME/.tmux.conf
    $HOME/.vim
    $HOME/.vimrc
    $HOME/.zshrc
"

for _f in $file; do
    if [ -e $_f ]; then
        mv $_f $backup_dir
    fi
done

# 安装现有的配置
ln -sf $f2tm_dir/git $XDG_CONFIG_DIRS/
ln -sf $f2tm_dir/python/pip $XDG_CONFIG_DIRS/
ln -sf $f2tm_dir/tmux/tmux.conf $HOME/.tmux.conf
ln -sf $f2tm_dir/vim/vimrc $HOME/.vimrc
ln -sf $f2tm_dir/vim/vim $HOME/.vim
ln -sf $f2tm_dir/zsh/zshrc $HOME/.zshrc
