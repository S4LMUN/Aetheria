#
# ~/.bashrc
#

[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

if [[ "$TERM" == "linux" ]]; then
    PS1='> '
else
    PS1='❱ '
fi