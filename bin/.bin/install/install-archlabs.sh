#!/bin/bash

sudo pacman -Suy --noconfirm
sudo pacman -S stow syncthing-gtk rxvt-unicode vim --noconfirm

#symlinks
git clone 

#vim setup and install
aurman -S vim-youcompleteme-git nerd-fonts-complete --noconfirm --pgp-fetch --skip-news
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
/home/dan/.vim/bundle/YouCompleteMe/install.sh -all
