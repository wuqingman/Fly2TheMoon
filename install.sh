#!/usr/bin/env bash

f2tm_dir="$HOME/Fly2TheMoon"
backup_dir="$HOME/backup"

if [ ! -d $backup_dir ];
then
    mkdir -p $backup_dir
fi

file="
    $HOME/.gitconfig
    $HOME/.pip
    $HOME/.pyenv
    $HOME/.tmux
    $HOME/.tmux.conf
    $HOME/.vim
    $HOME/.vimrc
    $HOME/.zshrc
"

for _f in $file
do
    if [ -e $_f ]; then
        mv $_f $backup_dir
    fi
done

ln -sf $f2tm_dir/git/gitconfig $HOME/.gitconfig
ln -sf $f2tm_dir/python/pip $HOME/.pip
ln -sf $f2tm_dir/python/pyenv $HOME/.pyenv
ln -sf $f2tm_dir/python/pyenv-implict $HOME/.pyenv/plugins
ln -sf $f2tm_dir/python/pyenv-virtualenv $HOME/.pyenv/plugins
ln -sf $f2tm_dir/tmux/tmux.conf $HOME/.tmux.conf
ln -sf $f2tm_dir/tmux/tmux $HOME/.tmux
ln -sf $f2tm_dir/vim/vimrc $HOME/.vimrc
ln -sf $f2tm_dir/vim/vim $HOME/.vim
ln -sf $f2tm_dir/zsh/zshrc $HOME/.zshrc

if which docker > /dev/null 2>&1; then
    curl -sSL https://get.daocloud.io/daotools/set_mirror.sh | sh -s http://f59c564e.m.daocloud.io
fi
