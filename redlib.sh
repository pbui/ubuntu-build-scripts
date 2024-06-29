PKGNAME=redlib
VERSION=0.35.0
WORKDIR=$(realpath $PKGNAME)
SRCDIR=$WORKDIR
MAKEDEPENDS=""
DISTFILE=https://github.com/redlib-org/redlib/releases/download/v${VERSION}/redlib

extract() {
    true
}

build() {
    cd $SRCDIR
}

install() {
    sudo install -m 755 redlib /usr/local/bin/redlib
}
