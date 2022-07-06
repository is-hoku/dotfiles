#!/bin/bash

for file in .??*
do
	[ "$file" = ".git" ] && continue
	ln -s ~/dotfiles/"$file" ~/"$file"
done

go install goa.design/goa/v3/cmd/goa@latest
go install golang.org/x/tools/cmd/godoc@latest
go install golang.org/x/tools/cmd/goimports@latest
go install github.com/rakyll/gotest@latest
