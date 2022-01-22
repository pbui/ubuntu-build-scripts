PKGNAME=isync
VERSION=1.4.4
WORKDIR=$(realpath $PKGNAME)
MAKEDEPENDS="libdb-dev libsasl2-dev libssl-dev zlib1g-dev "
DISTFILE=https://iweb.dl.sourceforge.net/project/$PKGNAME/$PKGNAME/$VERSION/$PKGNAME-$VERSION.tar.gz
CONFIGURE_ARGS="--prefix=/usr/local --sysconfdir=/etc"
