#!/bin/bash

sudo pacman -Suy --noconfirm
sudo pacman -S stow syncthing-gtk rxvt-unicode vim --noconfirm

###symlinks###
cd /home/$USER/.dotfiles

#backups
mv /home/$USER/.config/conky /home/$USER/.config/.conky-old
mv /home/$USER/.config/i3 /home/$USER/.config/.i3-old
mv /home/$USER/.config/polybar /home/$USER/.config/.polybar-old
mv /home/$USER/.config/jgmenu /home/$USER/.config/.jgmenu-old
mv /home/$USER/.config/ranger /home/$USER/.config/.ranger-old
mv /home/$USER/.config/termite /home/$USER/.config/.termite-old
mv /home/$USER/.config/urxvt /home/$USER/.config/.urxvt-old
mv /home/$USER/.config/tint2 /home/$USER/.config/.tint2-old
mv /home/$USER/.vimrc /home/$USER/.vimrc-old
mv /home/$USER/.zshrc /home/$USER/.zshrc-old
mv /home/$USER/.zprofile /home/$USER/.zprofile-old

#stow
stow /home/$USER/.dotfiles/*

#vim setup and install
aurman -S vim-youcompleteme-git nerd-fonts-complete --noconfirm --pgp-fetch --skip-news
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
/home/dan/.vim/bundle/YouCompleteMe/install.sh -all
