PKGNAME=bitlbee-discord
VERSION=0.4.3
WORKDIR=$(realpath $PKGNAME)
MAKEDEPENDS="autoconf libtool pkg-config bitlbee-dev libglib2.0-dev"
DISTFILE=https://github.com/sm00th/$PKGNAME/archive/refs/tags/$VERSION.tar.gz
PATCHES="https://github.com/sm00th/bitlbee-discord/commit/607f9887ca85f246e970778e3d40aa5c346365a7.patch"

build() {
    cd $SRCDIR
    ./autogen.sh
    ./configure --prefix=/usr
    make
}
