#!/bin/sh

PKGNAME=isync
VERSION=1.4.3
WORKDIR=$(realpath $PKGNAME)
MAKEDEPENDS="libdb-dev libsasl2-dev libssl-dev zlib1g-dev "
TARBALL=$PKGNAME-$VERSION.tar.gz
DISTFILE=https://iweb.dl.sourceforge.net/project/$PKGNAME/$PKGNAME/$VERSION/$TARBALL

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
    ./configure --prefix=/usr/local --sysconfdir=/etc
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
