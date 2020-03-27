umask 022
bindkey -v

REPORTTIME=2

alias	amke=make
alias	a=alias
alias	h=history
alias	j=jobs
alias	v=vi
alias	lo=logout
alias	md=mkdir
alias	pop=popd
alias	rd=rmdir
alias	fixsz='set noglob; eval `resize`;unset noglob'
alias	ls='ls	-Fv'
if ls -hld > /dev/null 2>/dev/null
then
    alias	ll='ls	-lFhv'
else
    alias	ll='ls	-lFv'
fi
alias	la='ls	-alsF'
alias	cup='cvs -q update -d -P'
alias	digs='dig +nocomments +nostats +nocmd'
if ack=`whence ack-grep`
then
    alias ack=$ack
fi
alias   darkbg='xtermcontrol --bg "#000" --fg "#FFF" --highlight="#00F"; export BG=dark'
alias   lightbg='xtermcontrol --bg "#F0F0F0" --fg "#000" --highlight="#0FF"; export BG=light'
alias   defaultbg='. ~/.zxtermcolors'
alias   ag='ag --color-path "34;47"'

namedir(){
	eval "$1=~+"
	: ~$1
}

pd(){
	if [[ $# = 0 ]]
	then 
		pushd +1
	else
		pushd "$@"
	fi
	namedir $(echo $(basename "$PWD" | tr -cd 'A-Za-z0-9_') | tr 'A-Z' 'a-z' | sed -e 's/^[0-9]/_&/')
        echo "$PWD"
}

setenv(){
	$1=$2
	export $1
}

harden(){
	cp -p "$1" .harden.$$ && mv .harden.$$ "$1"
}

moveoutoftheway(){
	mv "$1" "$1".old
}

dup(){
	mv $1 $1.orig && cp -p $1.orig $1
}

cls()	{ clear; true }

man () {
    LESS_TERMCAP_mb=$'\e'"[1;31m" \
    LESS_TERMCAP_md=$'\e'"[1;38;5;88m" \
    LESS_TERMCAP_me=$'\e'"[0m" \
    LESS_TERMCAP_se=$'\e'"[0m" \
    LESS_TERMCAP_so=$'\e'"[1;44;33m" \
    LESS_TERMCAP_ue=$'\e'"[0m" \
    LESS_TERMCAP_us=$'\e'"[1;38;5;22m" \
    command man "$@"
}

venv() {
    for d in venv/"$1" ve/"$1" ~/venv/"$1" "$1"
    do
        if [ -f "$d"/bin/activate ]
        then
            . "$d"/bin/activate
            break
        fi
    done
}

source ~/.znewterm

# assume pseudo terminals are from a "safe" terminal
# other terminals are probably from a console and should
# auto-logout after some time.
case `tty` in
/dev/pts/*)
    TMOUT=14400
    ;;
*)
    TMOUT=3600
esac

# and screen sessions shouldn't terminate at all ...
case "$TERM" in
screen)
    unset TMOUT
    ;;
esac

if [ -z "$EDITOR" ]
then
    export EDITOR=vi
fi

# prepend local function dir if we have one.
#
# Important: Don't clobber FPATH. It's needed for completion and usually
# contains a lot of directories (at least on Debian systems) and you
# don't want to recreate that mess manually.
if [ -d ~/bin/func ]
then
    FPATH=`preppath -v FPATH ~/bin/func`
fi

# for new style completion:
autoload -U compinit
compinit
