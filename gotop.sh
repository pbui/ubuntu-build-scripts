PKGNAME=gotop
VERSION=4.1.3
WORKDIR=$(realpath $PKGNAME)
SRCDIR=$WORKDIR
MAKEDEPENDS=""
DISTFILE=https://github.com/xxxserxxx/$PKGNAME/releases/download/v$VERSION/${PKGNAME}_v${VERSION}_linux_amd64.tgz

build() {
    cd $SRCDIR
}

install() {
    sudo install -D -m 755 gotop /usr/local/bin/gotop
}
