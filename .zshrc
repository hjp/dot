bindkey -v

alias	amke=make
alias	arm=/bin/rm
alias	a=alias
alias	h=history
alias	j=jobs
alias	v=vi
alias	lo=logout
alias	md=mkdir
alias	pop=popd
alias	rd=rmdir
alias	ball='pd /usr/local/projects/ball; source s'
alias	srcsrv='pd ~/wrk/srcservice/clients/exp'
alias	fixsz='set noglob; eval `resize`;unset noglob'
alias	ls='ls	-F'
alias	ll='ls	-lF'
alias	la='ls	-alsF'
alias	lc='ls	-l *.c'
alias	ts='tail /usr/spool/mqueue/syslog'
alias	train='pd ~/wrk/mars/train'
typeset -fu namedir xvi pd setenv
cls()	{ clear; true }

if [[ "$SHLVL" = 1 ]] 
then
	source .znewterm
fi
