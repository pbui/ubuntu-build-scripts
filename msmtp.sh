PKGNAME=msmtp
VERSION=1.8.25
WORKDIR=$(realpath $PKGNAME)
MAKEDEPENDS="autoconf libtool libssl-dev pkg-config libgnutls28-dev"
DISTFILE=https://marlam.de/$PKGNAME/releases/$PKGNAME-$VERSION.tar.xz
CONFIGURE_ARGS="--prefix=/usr/local --sysconfdir=/etc"
