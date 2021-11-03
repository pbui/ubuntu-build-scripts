#!/bin/sh

PKGNAME=cyrus-sasl-xoauth2
VERSION=0.2
WORKDIR=$(realpath $PKGNAME)
MAKEDEPENDS="autoconf libsasl2-dev libtool"
TARBALL=$PKGNAME-$VERSION.tar.gz
DISTFILE=https://github.com/moriyoshi/$PKGNAME/archive/refs/tags/v$VERSION.tar.gz

prepare() {
    mkdir -p $WORKDIR
}

fetch() {
    curl -L $DISTFILE > $WORKDIR/$TARBALL
}

extract() {
    cd $WORKDIR
    tar xvf $TARBALL
}

depends() {
    sudo apt install -y $MAKEDEPENDS
}

build() {
    cd $WORKDIR/$PKGNAME-$VERSION
    ./autogen.sh
    ./configure --prefix=/usr/local --sysconfdir=/etc
    make
}

install() {
    sudo make install
    sudo rsync -av --progress /usr/lib/sasl2/. /usr/lib/x86_64-linux-gnu/sasl2/.
    sudo rm -fr /usr/lib/sasl2
}

cleanup() {
    sudo apt autoremove -y $MAKEDEPENDS
    rm -fr $WORKDIR
}

prepare	&& \
fetch   && \
extract && \
depends && \
build   && \
install && \
cleanup
