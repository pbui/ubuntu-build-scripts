PKGNAME=bitlbee-discord
VERSION=0.4.3
WORKDIR=$(realpath $PKGNAME)
MAKEDEPENDS="autoconf libtool pkg-config bitlbee-dev libglib2.0-dev"
DISTFILE=https://github.com/sm00th/$PKGNAME/archive/refs/tags/$VERSION.tar.gz

build() {
    cd $SRCDIR
    ./autogen.sh
    ./configure --prefix=/usr
    make
}
