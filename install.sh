#!/bin/bash

# ~/dotfiles/.??* (ignore .git and .config directories)
for file in .??*; do
	[ "$file" = ".git" ] || [ "$file" = ".config" ] && continue
	ln -svf ~/dotfiles/"$file" ~/temporary/root/"$file"
done

# create a static link to the bin directory
ln -svf ~/dotfiles/bin ~/temporary/root/bin

# ~/dotfiles/.config/*
files=$(find ~/dotfiles/.config -type f)
for file in "$files"; do
	file2="${file#${HOME}/dotfiles/}"
	if [ ! -d "${HOME}/${file2%/*}" ]; then
		mkdir -p "${HOME}/${file2%/*}"
	fi
done

# create static links to files under the .config directory
for file in $files; do
	ln -svf "${file}" "/home/hoku/${file#${HOME}/dotfiles/}"
done

# create an undo directory for vim
mkdir -p ~/temporary/root/.vim/undo
# create a screenshots directory for flameshot
mkdir -p ~/temporary/root/Pictures/screenshots

# install packages from packages.txt
paru -Syu - < packages.txt
