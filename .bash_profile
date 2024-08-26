#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc


export QSYS_ROOTDIR="/home/hoku/.cache/paru/clone/quartus-free/pkg/quartus-free-quartus/opt/intelFPGA/23.1/quartus/sopc_builder/bin"

# opam configuration
test -r /home/hoku/.opam/opam-init/init.sh && . /home/hoku/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
