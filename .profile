# $FreeBSD: releng/11.2/share/skel/dot.profile 325815 2017-11-14 17:05:34Z trasz $
#
# .profile - Bourne Shell startup script for login shells
#
# see also sh(1), environ(7).
#

# These are normally set through /etc/login.conf.  You may override them here
# if wanted.
# PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:$HOME/bin; export PATH
# BLOCKSIZE=K;	export BLOCKSIZE

# Setting TERM is normally done through /etc/ttys.  Do only override
# if you're sure that you'll never log in via telnet or xterm or a
# serial line.
#TERM=xterm; 	export TERM

#PAGER=/usr/bin/more;  	export PAGER

# set ENV to a file invoked each time sh is started for interactive use.
#export ENV=$HOME/.kshrc
# Query terminal size; useful for serial lines.
if [ -x /usr/bin/resizewin ] ; then /usr/bin/resizewin -z ; fi

# Display a random cookie on each login.
if [ -x /usr/bin/fortune ] ; then /usr/bin/fortune freebsd-tips ; fi

PATH=$HOME/.local/bin:$PATH

export EDITOR=$HOME/.local/bin/vim
export FCEDIT=$HOME/.local/bin/vim
#export VISUAL="$HOME/.local/bin/gvim --remote"
export PAGER=/usr/bin/less
#export TERM=st-meta
#export TERM=xterm-256color
tput init
#For plan9port
PATH=$PATH:/usr/local/plan9/bin
#For Go
export GOROOT=$HOME/goroot
export GOPATH=$HOME/gospace
export GOROOT_BOOTSTRAP=$HOME/go1.4
PATH=$PATH:$GOROOT/bin:$GOPATH/bin

export LD_LIBRARY_PATH=$HOME/.local/lib/:$LD_LIBRARY_PATH
export GI_TYPELIB_PATH=$HOME/.local/lib/:$GI_TYPELIB_PATH

export FZF_DEFAULT_COMMAND='fd --type f'
PATH="$(yarn global bin):$PATH"

export FZF_DEFAULT_OPTS='--layout=reverse-list --inline-info --multi'                   

export PATH=$PATH:$HOME/.cargo/bin
export RUST_SRC_PATH=/usr/home/uvelichitel/.rustup/toolchains/stable-x86_64-unknown-freebsd/lib/rustlib/src/rust/src/

#For perl cpan
PATH=$PATH:$HOME/perl5/bin

PATH=$PATH:$HOME/.gem/ruby/2.6/bin

export MPD_HOST='192.168.1.11'
export MPC_FORMAT='[[%artist%] - %title%]|[%file%]'

export XDG_CONFIG_HOME=$HOME/.config

export XHKD_SHELL=/usr/local/bin/dash

export PATH
export CDPATH=:/home/uvelichitel/gospace/src/github.com/uvelichitel
