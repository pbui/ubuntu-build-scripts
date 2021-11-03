#!/bin/sh

PKGNAME=bitlbee-discord
VERSION=0.4.3
WORKDIR=$(realpath $PKGNAME)
MAKEDEPENDS="autoconf libtool pkg-config bitlbee-dev libglib2.0-dev"
TARBALL=$PKGNAME-$VERSION.tar.gz
DISTFILE=https://github.com/sm00th/$PKGNAME/archive/refs/tags/$VERSION.tar.gz

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
    ./configure --prefix=/usr
    make
}

install() {
    sudo make install
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
