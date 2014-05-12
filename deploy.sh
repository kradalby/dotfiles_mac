#!/bin/bash

CURRENT=~/git/dotfiles

function deploy() {
    ls -1 $CURRENT/rc/ | while read FILE;
        do
            rm ~/.$FILE
            ln -s $CURRENT/rc/$FILE ~/.$FILE
        done
}

function deploy_special() {
    ln -s $CURRENT/ssh/config ~/.ssh/
}

function prepare_vim_dir() {
    rm -r ~/.vim
    mkdir ~/.vim
}

function install_vim_markdown() {
    wget https://github.com/plasticboy/vim-markdown/archive/master.tar.gz -O ~/.vim/vim_markdown.tar.gz
    tar --strip=1 -zxf ~/.vim/vim_markdown.tar.gz -C ~/.vim/
    rm ~/.vim/vim_markdown.tar.gz
}

function install_vim_dhcpd() {
    wget https://raw.githubusercontent.com/vim-scripts/dhcpd.vim/master/syntax/dhcpd.vim -O ~/.vim/syntax/dhcpd.vim
}

#deploy
#prepare_vim_dir
#install_vim_markdown
#install_vim_dhcpd
deploy_special