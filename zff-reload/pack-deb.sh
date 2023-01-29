#!/bin/bash

# clone to usr/share/zff_reload
mkdir -p ./deb/usr/share/zff_reload
git clone https://github.com/ohzff/Zff-Reload ./deb/usr/share/zff_reload

# gather information
cd ./deb/usr/share/zff_reload
fullversion="$(git describe --tag)"
version="${fullversion%%-*}"
cd ../../../../

# generate control
cat <<EOX > "./deb/DEBIAN/control"
Package: zff-reload
Version: $version
Description: New Zff, the lightest adventure game.
Maintainer: Jiayi Wu <wjy@516wjy.xyz>
Homepage: https://github.com/ohzff/Zff-Reload
Section: game
Priority: extra
Essential: no
Architecture: all
Depends: g++
EOX

# copyright
cp ./deb/usr/share/zff_reload/LICENCE ./deb/DEBIAN/copyright

# define file
rm ./deb/usr/share/zff_reload/lib/system/data/DATA.hpp
cp ./deb/usr/share/zff_reload/lib/system/data/DATA_usr.hpp ./deb/usr/share/zff_reload/lib/system/data/DATA.hpp

# chmod
chmod 755 ./deb/DEBIAN/postinst

# dpkg
dpkg -b ./deb zff.deb
