#!/bin/bash

sudo pacman -R gvim --noconfirm
sudo pacman -Suy --noconfirm
sudo pacman -S cmake stow syncthing-gtk vim --noconfirm

###symlinks###
cd /home/$USER/.dotfiles

#backups
mv /home/$USER/.config/conky /home/$USER/.config/.conky-old
mv /home/$USER/.config/i3 /home/$USER/.config/.i3-old
mv /home/$USER/.config/polybar /home/$USER/.config/.polybar-old
mv /home/$USER/.config/jgmenu /home/$USER/.config/.jgmenu-old
mv /home/$USER/.config/ranger /home/$USER/.config/.ranger-old
mv /home/$USER/.config/termite /home/$USER/.config/.termite-old
mv /home/$USER/.config/tint2 /home/$USER/.config/.tint2-old
mv /home/$USER/.vimrc /home/$USER/.vimrc-old
mv /home/$USER/.zshrc /home/$USER/.zshrc-old
mv /home/$USER/.zprofile /home/$USER/.zprofile-old
mv /home/$USER/.Xresources /home/$USER/.Xresources-old

#stow
cd /home/$USER/.dotfiles
stow -R *

#vim setup and install
aurman -S vim-youcompleteme-git nerd-fonts-complete --noconfirm --pgp_fetch --skip_news --noedit
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
/home/dan/.vim/bundle/YouCompleteMe/install.sh --all

#dev
sudo pacman -S screen arduino kicad --noconfirm
sudo pacman -S maxima wxmaxima --noconfirm
wget https://github.com/FreeCAD/FreeCAD/releases/download/0.17/FreeCAD-0.17.13541.9948ee4.glibc2.17-x86_64.AppImage -O /home/$USER/bin/

#virt
sudo pacman -S qemu docker ovmf virt-manager --noconfirm
sudo systemctl start libvirtd
sudo systemctl enable libvirtd
sudo virsh net-autostart --network default
sudo systemctl enable dockerd
sudo systemctl start dockerd

#disable ipv6 for vlc to see upnp
sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1

