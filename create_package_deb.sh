#!/bin/sh

set -e

# Nom du paquet
PKGNAME="browser-watch"
SOURCE=sources
BUILD=deb-build
DIST=deb-dist

# On s'assure que le dossier temporaire est *clean*
rm -rf $BUILD
mkdir $BUILD

if [ ! -d $DIST ];then
    mkdir -p $DIST
fi

# Création de la structure du paquet
mkdir -p $BUILD/DEBIAN
mkdir -p $BUILD/usr/lib/$PKGNAME/{cron.d,systemd/system}
mkdir -p $BUILD/usr/share/doc/$PKGNAME
mkdir -p $BUILD/usr/share/man/{man1,fr/man1}

#compression de changelog.Debian
gzip -k -9 $SOURCE/changelog.Debian > /dev/null
#compression de browser-watch.1
gzip -k -9 $SOURCE/$PKGNAME.1 > /dev/null

# Copie des fichiers dans le répertoire source.
# D'abord le répertoire DEBIAN puis le contenu de l'application
cp $SOURCE/control                $BUILD/DEBIAN
cp $SOURCE/postinst               $BUILD/DEBIAN
cp $SOURCE/postrm                 $BUILD/DEBIAN
cp $SOURCE/prerm                  $BUILD/DEBIAN
cp $SOURCE/config                 $BUILD/DEBIAN
cp $SOURCE/templates              $BUILD/DEBIAN
cp $SOURCE/changelog.Debian.gz    $BUILD/usr/share/doc/$PKGNAME
cp $SOURCE/$PKGNAME.1.gz          $BUILD/usr/share/man/fr/man1
cp $SOURCE/$PKGNAME.1.gz          $BUILD/usr/share/man/man1
cp $SOURCE/copyright              $BUILD/usr/share/doc/$PKGNAME
cp -R $SOURCE/bin                 $BUILD/usr/lib/$PKGNAME

# définit les attributs
find $BUILD -type d -exec chmod 0755 {} \;  # Dossiers
find $BUILD -type f -exec chmod 0644 {} \;  # Fichiers
find $BUILD/usr/lib/$PKGNAME/bin -type f -exec chmod 0755 {} \;  # exécutables

# scripts du paquet
chmod 755 $BUILD/DEBIAN/postinst
chmod 755 $BUILD/DEBIAN/prerm
chmod 755 $BUILD/DEBIAN/postrm
chmod 755 $BUILD/DEBIAN/config
chmod 755 $BUILD/DEBIAN/templates

#Suppression de changelog.Debian.gz (fichier compressé)
rm $SOURCE/changelog.Debian.gz
#Suppression de browser-watch.1.gz (fichier compressé)
rm $SOURCE/$PKGNAME.1.gz

# et finalement on construit le paquet avec --root-owner-group pour
# définir root en tant que propriétaire de l'ensemble du contenu du paquet
dpkg-deb --root-owner-group --build $BUILD $DIST
