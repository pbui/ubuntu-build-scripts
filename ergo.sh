#!/bin/sh

PKGNAME=ergo
VERSION=2.8.0
WORKDIR=$(realpath $PKGNAME)
MAKEDEPENDS=""
TARBALL=$PKGNAME-$VERSION.tar.xz
DISTFILE=https://github.com/ergochat/$PKGNAME/releases/download/v$VERSION/$PKGNAME-$VERSION-linux-x86_64.tar.gz

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
    :
}

build() {
    cd $WORKDIR/$PKGNAME-$VERSION-linux-x86_64
}

install() {
    sudo install -m 755 ergo /usr/local/bin/ergo
    sudo mkdir -p /usr/local/share/ergo
    sudo rsync -av --progress languages /usr/local/share/ergo/.
}

cleanup() {
    rm -fr $WORKDIR
}

prepare	&& \
fetch   && \
extract && \
depends && \
build   && \
install && \
cleanup
