PKGNAME=gotop
VERSION=4.1.2
WORKDIR=$(realpath $PKGNAME)
SRCDIR=$WORKDIR
MAKEDEPENDS=""
TARBALL=$PKGNAME-$VERSION.tgz
DISTFILE=https://github.com/xxxserxxx/$PKGNAME/releases/download/v$VERSION/${PKGNAME}_v${VERSION}_linux_amd64.tgz

build() {
    cd $SRCDIR
}

install() {
    sudo install -m 755 gotop /usr/local/bin/gotop
}
