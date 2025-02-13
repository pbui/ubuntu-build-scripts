PKGNAME=ergo
VERSION=2.15.0
WORKDIR=$(realpath $PKGNAME)
SRCDIR=$WORKDIR/$PKGNAME-$VERSION-linux-x86_64
MAKEDEPENDS=""
DISTFILE=https://github.com/ergochat/$PKGNAME/releases/download/v$VERSION/$PKGNAME-$VERSION-linux-x86_64.tar.gz

build() {
    cd $SRCDIR
}

install() {
    sudo install -m 755 ergo /usr/local/bin/ergo
    sudo mkdir -p /usr/local/share/ergo
    sudo rsync -av --progress languages /usr/local/share/ergo/.
}
