#!/bin/bash

# Utilities

fn_exists() {
    declare -F "$1" > /dev/null;
}

# Stages

do_prepare() {
    if fn_exists "prepare"; then
    	prepare
    	return $?
    fi

    # Default action
    mkdir -p $WORKDIR
}

do_fetch() {
    if fn_exists "fetch"; then
    	fetch
    	return $?
    fi

    # Default action
    curl -L $DISTFILE > $WORKDIR/$TARBALL
}

do_extract() {
    if fn_exists "extract"; then
    	extract
    	return $?
    fi

    # Default action
    cd $WORKDIR
    tar xvf $TARBALL
}

do_depends() {
    if fn_exists "depends"; then
    	depends
    	return $?
    fi

    # Default action
    if [ -n "$MAKEDEPENDS" ]; then
	sudo apt install -y $MAKEDEPENDS
    fi
}

do_build() {
    CONFIGURE_ARGS=${CONFIGURE_ARGS:-"--prefix=/usr/local"}
    SRCDIR=${SRCDIR:-$WORKDIR/$PKGNAME-$VERSION}

    if fn_exists "build"; then
    	build
    	return $?
    fi

    # Default action
    cd $SRCDIR
    ./configure $CONFIGURE_ARGS
    make
}

do_install() {
    if fn_exists "install"; then
    	install
    	return $?
    fi

    # Default action
    sudo make install
}

do_cleanup() {
    if fn_exists "cleanup"; then
    	cleanup
	return $?
    fi

    # Default action
    if [ -n "$MAKEDEPENDS" ]; then
	sudo apt autoremove -y $MAKEDEPENDS
    fi
    rm -fr $WORKDIR
}

do_ubs() {
    source $1
    do_prepare && \
    do_fetch   && \
    do_extract && \
    do_depends && \
    do_build   && \
    do_install && \
    do_cleanup
}

do_ubs $1
