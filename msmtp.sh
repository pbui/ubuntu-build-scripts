PKGNAME=msmtp
VERSION=1.8.19
WORKDIR=$(realpath $PKGNAME)
MAKEDEPENDS="libssl-dev pkg-config libgnutls28-dev"
DISTFILE=https://marlam.de/$PKGNAME/releases/$PKGNAME-$VERSION.tar.xz
CONFIGURE_ARGS="--prefix=/usr/local --sysconfdir=/etc"
