#!/bin/bash

mkdir ~/sakura

git clone https://github.com/sakura-theme/dir_colors.git ~/sakura/dir_colors
ln -svf ~/sakura/dir_colors/.dir_colors ~/.dir_colors

git clone https://github.com/sakura-theme/icons.git ~/sakura/icons
ln -svf ~/sakura/icons ~/.icons/sakura

git clone https://github.com/sakura-theme/gtk.git ~/sakura/gtk
ln -svf ~/sakura/gtk ~/.themes/sakura

git clone https://github.com/sakura-theme/fcitx5.git ~/sakura/fcitx5
ln -svf ~/sakura/fcitx5 ~/.local/share/fcitx5/themes/sakura

git clone https://github.com/sakura-theme/alacritty.git ~/sakura/alacritty

git clone https://github.com/sakura-theme/dunst.git ~/sakura/dunst
ln -svf ~/sakura/dunst/dunstrc ~/.config/dunst/dunstrc

git clone https://github.com/sakura-theme/polybar.git ~/sakura/polybar
ln -svf ~/sakura/polybar ~/.config/polybar

git clone https://github.com/sakura-theme/rofi.git ~/sakura/rofi
ln -svf ~/sakura/rofi/themes ~/.config/rofi/themes

git clone https://github.com/sakura-theme/vifm.git ~/sakura/vifm
ln -svf ~/sakura/vifm/colors ~/.config/vifm/colors

git clone https://github.com/sakura-theme/zathura.git ~/sakura/zathura
ln -svf ~/sakura/zathura/zathurarc ~/.config/zathura/zathurarc

git clone https://github.com/sakura-theme/qt.git ~/sakura/qt
ln -svf ~/sakura/qt/sakura.conf ~/.config/qt5ct/colors/sakura.conf
