# this is sourced for login shells after .zshenv but before .zshrc
#
# Once upon a tim this was also sourced at the start of an Xsession, but
# that doesn't seem to be the case for my current debian systems (with
# lightdm/xfce) any more. So everything set here isn't available in X11.
umask 022

unset MAILCHECK

if [ -f /etc/sysconfig/i18n ]
then
    . /etc/sysconfig/i18n
    export LANG
fi

. ~/.zjava

# Set to non-working default values on SUSE Linux.
# I don't use that anyway, so I just unset these values:
unset LESSOPEN LESSCLOSE

# for TGIF:
if [ -f /etc/X11/rgb.txt ]
then
    export RGBDEF=/etc/X11/rgb.txt
fi

limit coredumpsize unlimited
