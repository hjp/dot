
unsetopt BGNICE
setopt CHASELINKS
setopt AUTO_CD
setopt AUTO_PUSHD
setopt EXTENDED_GLOB
setopt EXTENDED_HISTORY
setopt LIST_TYPES
unsetopt MARKDIRS
unsetopt MENU_COMPLETE
unsetopt NO_CLOBBER
setopt NOTIFY
setopt NUMERIC_GLOB_SORT
setopt PRINT_EXIT_VALUE
setopt PUSHD_SILENT
setopt PUSHD_TO_HOME
setopt RMSTARSILENT
setopt NO_PROMPT_CR
setopt APPEND_HISTORY

setopt PUSHD_IGNORE_DUPS

SAVEHIST=1000
HISTSIZE=2000
HISTFILE=~/.zhistory
export PGPPATH=~/.pgp
export PARINIT=q1
export PARBODY=_A_a
export DEBEMAIL=hjp@hjp.at
export DEB_SIGN_KEYID=4ED25B463C8FC154D8189E64F20E485112FE285D
export ACK_COLOR_FILENAME='blue on_white'


# don't rely on a sane path at this point:
for i in /usr/bin/preppath /usr/local/bin/preppath
do
    if [ -x $i ]
    then
    	preppath=$i
	break;
    fi
done

if [ -n "$preppath" ]
then
    if [ -r /etc/PATH ]
    then
	PATH=$($preppath $(cat /etc/PATH) )
    fi

    # first prepend important stuff - in order of increasing priority:

    setopt NULL_GLOB

    PATH=`$preppath -c /usr/bin/X11:/usr/games:/usr/contrib/bin`
    PATH=`$preppath -c /bin:/usr/bin`
    # Debian's open/libre office is in /usr/bin, so we need to prepend 
    # the current version before it:
    PATH=`$preppath -c /usr/sbin:/sbin`
    PATH=`$preppath -c /usr/local/sbin:/usr/local/bin`
    `$preppath -c -e /usr/local/node-v8.9.4-linux-x86/bin`
    `$preppath -c -e -r /usr/lib/go-1.*/bin`
    PATH=`$preppath -c $HOME/scripts`
    PATH=`$preppath -c $HOME/bin/hosts:$HOME/bin`

    # then append less important stuff
    PATH=`apppath -c /usr/local/www/offline/devel.fiw/bin`

    unsetopt NULL_GLOB
fi

if [ -r /etc/MANPATH ]
then
	MANPATH=`cat /etc/MANPATH`:$MANPATH
else
	ALL_PATH=/usr/local/qmail/man:/usr/man:/usr/local/man:/usr/X11R6/man:/usr/share/man:/usr/local/pgsql/man:/var/qmail/man:/usr/local/rrdtool-1.0.35/man
	NEW_PATH=""

	for i in ${(s/:/)ALL_PATH}
	do
		if test -d "$i"
		then
			case "$NEW_PATH" in
			$i:*|*:$i|*:$i:*) ;;
			*)
				if test -z "$NEW_PATH"
				then
					NEW_PATH=$i
				else
					NEW_PATH=$NEW_PATH:$i
				fi
			esac
		fi
	done
	MANPATH=$NEW_PATH
fi
export MANPATH


case "`uname -sr`" in
Linux*)
	export LC_COLLATE=POSIX
	if [ -z "$LANG" ]
	then
	    utf=`locale -a | grep en_US.utf8`
	    if [ -n "$utf" ]
	    then
		# this is a bit of a hack -
		# locale -a advertises the locale as "en_US.utf8",
		# but the glibc accepts both "en_US.utf8" and
		# "en_US.UTF-8" and xterm recogizes only the latter.
		# So we explicitely set the latter, even though that's
		# not the canonical name and may break some day.
		# 
		LANG=en_US.UTF-8
	    else 
		# fall back to latin 1.
		LANG=en_US.iso88591
	    fi
	    export LANG
	fi
	# export LC_TIME=de_AT # don't remember what that was for
	;;
esac

case "$LANG" in
*.iso88591)
	export LESSCHARSET=latin1
	export NLS_LANG=american_america.WE8ISO8859P1
	;;
*.UTF-8)
	export NLS_LANG=american_america.UTF8
	;;
esac

export NLS_DATE_FORMAT='YYYY-MM-DD HH24:MI:SS'


if [ -x /usr/bin/less ]
then
	export PAGER="/usr/bin/less -i"
elif [ -x /usr/local/bin/less ]
then
	export PAGER="/usr/local/bin/less -i"
fi
if [ -z "$XAUTHORITY" ] 
then
	export XAUTHORITY=$HOME/.Xauthority
fi

case "$HOST" in 
   *.*)
	export FQDN=$HOST
	;;
   *)
	export FQDN=`fqdn`
	;;
esac

case "$FQDN" in
   *.wsr.ac.at)
	export LPDEST=wsrcolor
	;;
esac

case "$FQDN" in
   *.luga.at|*.luga.or.at)
	export CVSROOT=cvs.luga.at:/home/cvs
	;;
   *)
	export CVSROOT=cvs.wsr.ac.at:/usr/local/src/master
	;;
esac

for i in /usr/local/bin/ssh /usr/bin/ssh
do
    if [ -x $i ]
    then
	export CVS_RSH=$i
	export RSYNC_RSH=$i
    fi
done

if test "`uname`" = Linux
then
    limit coredumpsize 64M
fi

case "$FQDN" in
   *.hjp.at)
	export NNTPSERVER=news.luga.at
	;;
   *.wsr.ac.at)
	export NNTPSERVER=news.wsr.ac.at
	;;
esac

case "$FQDN" in
   pashkan.wsr.ac.at)
	export LD_LIBRARY_PATH=`preppath -v LD_LIBRARY_PATH /usr/local/lib`
	;;
    hrunkner.hjp.at)
        export LD_LIBRARY_PATH=`apppath -v LD_LIBRARY_PATH /usr/lib/jni`
        ;;
   *.wsr.ac.at)
	;;
esac


export TABLE_DELIMITER='|'

if [ -d /usr/local/pgsql/data/ ]
then
	export PGDATA=/usr/local/pgsql/data/
fi

export MAKEFLAGS="-I $HOME/include"
if [ -d /usr/local/www ]
then
    export HOME_WWW=/usr/local/www
elif [ -d /home/www ]
then
    export HOME_WWW=/home/www
fi

if [ -f $HOME/etc/oraenv ] 
then 
	. $HOME/etc/oraenv
elif [ -f /etc/oraenv ]
then
	. /etc/oraenv
fi
if [ -n "$ORACLE_HOME" ]
then
    PATH=`apppath "$ORACLE_HOME/bin"`
fi

case "$FQDN" in
   shalmaneser.wsr.ac.at)
	export WZRP_CONN=~/.dbi/fiwssd
	;;
   pashkan.wsr.ac.at)
	export WZRP_CONN=~/.dbi/fiwdevel
	;;
   algernon.wsr.ac.at)
	export WZRP_CONN=~/.dbi/fiwssd
	;;
   enmetena.wsr.ac.at)
	export WZRP_CONN=~/.dbi/fiwdevel
	;;
esac

case "$FQDN" in
    shalmaneser.wsr.ac.at|pashkan.wsr.ac.at)
	export  PERL5LIB=`apppath -c -v PERL5LIB ~/lib/perl5 /usr/local/www/offline/$USER.fiw/lib/perl5 /usr/local/www/offline/dal.fiw/lib/perl5`
	PATH=`apppath -c /usr/local/www/offline/$USER.fiw/bin /usr/local/www/offline/dal.fiw/bin`
	;;
esac

case "$FQDN" in
   algernon.wsr.ac.at)
	export PGHOST=$FQDN
        export PGUSER=fiw
	;;
   pashkan.wsr.ac.at)
	export PGHOST=$FQDN
        export PGUSER=fiw
	;;
    teleute.wsr.ac.at)
	export PGHOST=wds.wifo.ac.at
        ;;
esac

case "$FQDN" in
   *.wsr.ac.at)
	export LOCALDOMAIN="wsr.ac.at hjp.at"
	;;
esac

case "$FQDN" in
   tsimri.wsr.ac.at)
        export GET_PASS_FILES="/home/hjp/wrk/admin/info/pwd_work.gpg /home/hjp/Notes/pw.gpg"
	;;
esac

if [ -f ~/perl5/perlbrew/etc/bashrc ]
then
    source ~/perl5/perlbrew/etc/bashrc
fi

case "$FQDN" in
   oro.wsr.ac.at)
        cleansing=~/wrk/wds/Software/WDS/Module/30_CLEANSING
        $(preppath -e -v PYTHONPATH -c $cleansing/lib)
        $(preppath -e -v PYTHONPATH -c $cleansing/system/app/extraction)
	;;
esac


case "$FQDN" in
   *.wsr.ac.at)
        export GIT_AUTHOR_EMAIL="$LOGNAME@wsr.ac.at"
	;;
esac

if [ -d /etc/profile.d ]
then
    for i in /etc/profile.d/*.sh
    do
        . $i
    done
fi
