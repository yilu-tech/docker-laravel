NORMAL="\[\e[0m\]"
CYAN="\[\e[1;36m\]"
GREEN="\[\e[1;32m\]"

PS1="$GREEN\h$NORMAL: $CYAN\W $NORMAL"

if [ `whoami` = root ]; then
	PS1="$PS1# "
else
	PS1="$PS1\$ "
fi

