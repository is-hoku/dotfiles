#!/bin/bash

for file in .??*
do
	[ "$file" = ".git" ] && continue
	ln -s ~/dotfiles/"$file" ~/"$file"
done
