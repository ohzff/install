#!/bin/bash

# clone to usr/share/zff_reload
mkdir -p ./deb/usr/share/zff_reload
git clone https://github.com/ohzff/Zff-Reload ./deb/usr/share/zff_reload

# gather information
cd ./deb/usr/share/zff_reload
version="$(git describe --tag)"
cd ../../../../

# generate control
cat <<EOX > "./deb/DEBIAN/control"
Package: zff_reload
Version: $version
Description: New Zff, the lightest adventure game.
Section: game
Priority: extra
Essential: no
Architecture: any
Depends: g++
EOX

# copyright
cp ./deb/usr/share/zff_reload/LICENSE ./deb/DEBIAN/copyright

# define file
rm ./deb/usr/share/zff_reload/lib/system/data/DATA.hpp
cp ./deb/usr/share/zff_reload/lib/system/data/DATA_usr.hpp ./deb/usr/share/zff_reload/lib/system/data/DATA.hpp

#dpkg
dpkg -b ./deb zff.deb
