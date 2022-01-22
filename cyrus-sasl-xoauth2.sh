PKGNAME=cyrus-sasl-xoauth2
VERSION=0.2
WORKDIR=$(realpath $PKGNAME)
MAKEDEPENDS="autoconf libsasl2-dev libtool"
DISTFILE=https://github.com/moriyoshi/$PKGNAME/archive/refs/tags/v$VERSION.tar.gz

build() {
    cd $SRCDIR
    ./autogen.sh
    ./configure --prefix=/usr/local --sysconfdir=/etc
    make
}

install() {
    sudo make install
    sudo rsync -av --progress /usr/lib/sasl2/. /usr/lib/x86_64-linux-gnu/sasl2/.
    sudo rm -fr /usr/lib/sasl2
}
