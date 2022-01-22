PKGNAME=minidlna
VERSION=1.3.0
WORKDIR=$(realpath $PKGNAME)
MAKEDEPENDS="libavcodec-dev libavformat-dev libflac-dev libexif-dev libid3tag0-dev libjpeg-dev libvorbis-dev libsqlite3-dev gettext"
DISTFILE=https://iweb.dl.sourceforge.net/project/$PKGNAME/$PKGNAME/$VERSION/$PKGNAME-$VERSION.tar.gz
