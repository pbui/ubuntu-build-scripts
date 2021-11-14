PKGNAME=isync
VERSION=1.4.3
WORKDIR=$(realpath $PKGNAME)
MAKEDEPENDS="libdb-dev libsasl2-dev libssl-dev zlib1g-dev "
TARBALL=$PKGNAME-$VERSION.tar.gz
DISTFILE=https://iweb.dl.sourceforge.net/project/$PKGNAME/$PKGNAME/$VERSION/$TARBALL
CONFIGURE_ARGS="--prefix=/usr/local --sysconfdir=/etc"
