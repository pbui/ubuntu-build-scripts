PKGNAME=makemkv
VERSION=1.16.5
WORKDIR=$(realpath $PKGNAME)
MAKEDEPENDS="libssl-dev libexpat1-dev libavcodec-dev libgl1-mesa-dev qtbase5-dev zlib1g-dev"
DISTFILE="https://www.makemkv.com/download/makemkv-bin-$VERSION.tar.gz
  https://www.makemkv.com/download/makemkv-oss-$VERSION.tar.gz"

configure() {
    cd $WORKDIR/makemkv-oss-$VERSION
    ./configure $CONFIGURE_ARGS

    cd $WORKDIR/makemkv-bin-$VERSION
    ./configure $CONFIGURE_ARGS
}

build() {
    cd $WORKDIR/makemkv-oss-$VERSION
    make

    cd $WORKDIR/makemkv-bin-$VERSION
    make
}

install() {
    cd $WORKDIR/makemkv-oss-$VERSION
    sudo make PREFIX=/usr/local install
    
    cd $WORKDIR/makemkv-bin-$VERSION
    sudo make PREFIX=/usr/local install
}

# https://forum.makemkv.com/forum/viewtopic.php?f=3&t=224
