#!/usr/bin/env bash


install_vim() {

    echo "Installing vim..."

    # get vundle
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    # copy vimrc config
    cp $HOME/config/dotfiles/vim/vimrc $HOME/.vimrc

    # install plugins
    vim +PluginInstall +qall

    # compile YouCompleteMe core
    python $HOME/.vim/bundle/YouCompleteMe/install.py --clang-completer
}

install_vim
