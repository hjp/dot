#
# $Id: .zprofile,v 1.14 2005-02-22 18:22:34 hjp Exp $
#
# this is sourced for login shells after .zshenv but before .zshrc
#
umask 022
if [ -f /usr/local/bin/findsock ]
then
	sock=`findsock $$`
fi
if [ -z "$sock" ]
then
	vhost=`hostname`
else 
	vhost="$sock"
fi
vhost=`echo "$vhost" | cut -d . -f 1`
RECHNER=$vhost

if [ -f /etc/oraprofile ]
then
    . /etc/oraprofile
fi

unset MAILCHECK
export EDITOR=vi

if [ -f /etc/sysconfig/i18n ]
then
    . /etc/sysconfig/i18n
    export LANG
fi

. ~/.zjava

# Set to non-working default values on SUSE Linux.
# I don't use that anyway, so I just unset these values:
unset LESSOPEN LESSCLOSE
