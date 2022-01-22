PKGNAME=makemkv
VERSION=1.16.5
WORKDIR=$(realpath $PKGNAME)
MAKEDEPENDS="libssl-dev libexpat1-dev libavcodec-dev libgl1-mesa-dev qtbase5-dev zlib1g-dev"
DISTFILE="https://www.makemkv.com/download/makemkv-bin-$VERSION.tar.gz
  https://www.makemkv.com/download/makemkv-oss-$VERSION.tar.gz"
CONFIGURE_ARGS="--prefix=/usr/local"

# https://forum.makemkv.com/forum/viewtopic.php?f=3&t=224
