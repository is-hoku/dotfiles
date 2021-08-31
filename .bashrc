#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias mozc-settings='/usr/lib/mozc/mozc_tool --mode=config_dialog'
PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"
eval $(dircolors ~/.dir_colors)

export PATH=$PATH:~/bin
export GOPATH=~/go
export PATH="$GOPATH/bin:$PATH"

export QSYS_ROOTDIR="/home/hoku/.cache/yay/quartus-free/pkg/quartus-free-quartus/opt/intelFPGA/20.1/quartus/sopc_builder/bin"
