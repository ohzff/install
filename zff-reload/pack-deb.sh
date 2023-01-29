#!/bin/bash

# clone to usr/share/zff_reload
git clone https://github.com/ohzff/Zff-Reload ./tmp

# gather information
cd ./tmp
fullversion="$(git describe --tag)"
version="${fullversion%%-*}"
cd ../

# get source
wget "https://github.com/ohzff/Zff-Reload/archive/refs/tags/$version.tar.gz" -O "./zff-reload-$version.tar.gz"
tar -xf ./zff-reload-$version.tar.gz

mkdir -p ./deb/usr/share/zff_reload
cp -r "./lib" "./deb/usr/share/zff_reload/"
cp -r "./usr" "./deb/usr/share/zff_reload/"
cp "./main.cpp" "./deb/usr/share/zff_reload/"
cp "./LICENCE" "./deb/usr/share/zff_reload/"
cp "./README.md" "./deb/usr/share/zff_reload/"

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
dpkg -b ./deb Zff-Ubuntu-any.deb
