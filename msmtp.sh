#!/bin/sh

PKGNAME=msmtp
VERSION=1.8.18
WORKDIR=$(realpath $PKGNAME)
MAKEDEPENDS="libssl-dev pkg-config libgnutls28-dev"
TARBALL=$PKGNAME-$VERSION.tar.xz
DISTFILE=https://marlam.de/$PKGNAME/releases/$TARBALL

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
