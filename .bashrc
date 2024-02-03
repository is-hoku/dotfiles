#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color'
PS1='[\u@\h \W]\$ '
set -o vi

eval "$(starship init bash)"
eval $(dircolors ~/.dir_colors)

if [ -d "$HOME/.bookmarks" ]; then
	export CDPATH=".:$HOME/.bookmarks"
	alias goto="cd -P"
	_goto()
	{
		local IFS=$'\n'
		COMPREPLY=( $(compgen -W "$(/bin/ls ~/.bookmarks)" -- "${COMP_WORDS[COMP_CWORD]}") )
	} && complete -F _goto goto
fi

export PATH=$PATH:~/bin
export GOPATH=~/go
export PATH="$GOPATH/bin:$PATH"

export QSYS_ROOTDIR="/home/hoku/.cache/paru/clone/quartus-free/pkg/quartus-free-quartus/opt/intelFPGA/21.1/quartus/sopc_builder/bin"

source /usr/share/git/completion/git-completion.bash

export FCITX_CONFIG_DIR="/home/hoku/.config/fcitx5"

# Swagger ui preview
function swagger_yaml2json() {
	TMP_DIR="/tmp/vim-swagger-preview/"
	LOG=$TMP_DIR"validate.log"
	docker run  --rm -v $(pwd):/docs openapitools/openapi-generator-cli validate -i /docs/"$1" > $LOG 2>&1
	count=$(wc -l < $LOG)
	if [[ $count -gt 2 ]]; then
		# File exists and has a size greater than zero
		return 1
	else
		if grep -q "docker daemon running" $LOG; then
			return 2
		else
			# dump the stdout stderr to file otherwise the caller function complains
			docker run -v $(pwd):/docs -v $TMP_DIR:/out openapitools/openapi-generator-cli generate -i /docs/"$1" -g openapi -o /out > $LOG 2>&1
			# clear the log file
			cp /dev/null $LOG
			# https://github.com/swagger-api/swagger-codegen/issues/9140
			# docker run -v $(pwd):/docs -v $TMP_DIR:/out swaggerapi/swagger-codegen-cli-v3:3.0.9 generate -i /docs/"$1" -l openapi -o /out > /dev/null 2>&1
			return 0
		fi
	fi
}
export -f swagger_yaml2json
function swagger_ui_start() {
	CONTAINER_NAME=${1:-swagger-ui-preview}
	TMP_DIR="/tmp/vim-swagger-preview/"
	# VOLUME=$(echo $(pwd) | tr "/" "_")
	if [ ! "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
		if [ "$(docker ps -aq -f status=exited -f name=$CONTAINER_NAME)" ]; then
			echo $CONTAINER_NAME "exited, cleaning"
			# cleanup
			# echo removing: 
			docker rm $CONTAINER_NAME
		fi
		# run the container
		docker run --name $CONTAINER_NAME -d -p 8017:8080 -e SWAGGER_JSON=/docs/openapi.json -v $TMP_DIR:/docs swaggerapi/swagger-ui
	elif [ "$(docker ps -aq -f status=running -f name=$CONTAINER_NAME)" ]; then
		echo $CONTAINER_NAME "is already running"
	fi
}
export -f swagger_ui_start
function swagger_preview() {
	TMP_DIR="/tmp/vim-swagger-preview/"
	LOG=$TMP_DIR"validate.log"
	#SOURCE=${1:-swagger.yaml}
	SOURCE=${1:-openapi3.yaml}
	$(swagger_yaml2json $SOURCE)
	YAML2JSON_RETURN_CODE=$?
	if [ "$YAML2JSON_RETURN_CODE" -eq "0" ]; then
		swagger_ui_start
	else
		cat $LOG
		echo "Converting to json failed!"
	fi
}
export -f swagger_preview

eval $(opam env)
export YACC_LANGUAGE_SERVER=/home/hoku/projects/yacc-language-server/

export WINEPREFIX=~/.wine
