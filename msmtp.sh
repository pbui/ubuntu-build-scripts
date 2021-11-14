PKGNAME=msmtp
VERSION=1.8.18
WORKDIR=$(realpath $PKGNAME)
MAKEDEPENDS="libssl-dev pkg-config libgnutls28-dev"
TARBALL=$PKGNAME-$VERSION.tar.xz
DISTFILE=https://marlam.de/$PKGNAME/releases/$TARBALL
CONFIGURE_ARGS="--prefix=/usr/local --sysconfdir=/etc"
