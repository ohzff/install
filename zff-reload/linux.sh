#!/bin/bash

# Installation file of Zff-Reload.
# 2023 01 12

checkcmd(){
    if command -v "${1%% *}" >/dev/null 2>&1; then 
        echo '1' 
    else 
        # echo the text 'Command Not Found!' in red color, the text 'Command Not Found!' is not printed in red color to stderr
        echo -e "\033[31mCommand Not Found!\033[0m" >&2
    fi
}

echo "Checking system..."

if [ "$(checkcmd "git")" != "1" ]
then
    echo -e "\033[31mPlease install git and try again.\033[0m"
    exit 1
fi

if [ "$(checkcmd "g++")" != "1" ]
then
    echo -e "\033[31mPlease install g++ and try again.\033[0m"
    exit 1
fi

if [ -z "$ZFFDIR" ]
then
    ZFFDIR="/usr/share/"
fi
if [ -z "$ZFFBIN" ]
then
    ZFFBIN="/usr/bin/"
fi

if [ ! -w "$ZFFDIR" ]
then
    echo -e "\033[31m$ZFFDIR: operation not permitted. Use sudo!\033[0m"
    exit 2
fi

if [ ! -w "$ZFFBIN" ]
then
    echo -e "\033[31m$ZFFBIN: operation not permitted. Use sudo!\033[0m"
    exit 2
fi

if [ "${ZFFDIR: -1: 1}" != "/" ]
then
    ZFFDIR="$ZFFDIR/zff_reload"
else
    ZFFDIR="${ZFFDIR}zff_reload"
fi

if [ "${ZFFBIN: -1: 1}" != "/" ]
then
    ZFFBIN="$ZFFBIN/zff"
else
    ZFFBIN="${ZFFBIN}zff"
fi

echo "Starting install Zff-Reload..."

if [ "$1" = '-u' ]
then
    if [ -d "$ZFFDIR" ]
    then
        echo "We will do overwrite \"$ZFFDIR\" and \"$ZFFBIN\", are you sure?"
        echo -n "[y/n]> "
        read -r -n1 x
        echo "%"
        if [ "$x" = "y" ] || [ "$x" = "Y" ]
        then
            echo "You said yes!"
            # IF something to save, put it here.
            rm -rf "$ZFFDIR"
            rm -rf "$ZFFBIN"
        else
            echo "You said no, Abort!"
            exit
        fi
    fi
fi

echo "Installing application file to $ZFFDIR..."
mkdir -p "$ZFFDIR"
git clone https://github.com/ohzff/Zff-Reload.git "$ZFFDIR"

echo "Generating DATA.hpp..."
rm "$ZFFDIR/lib/system/data/DATA.hpp"
cat <<EOF > "$ZFFDIR/lib/system/data/DATA.hpp"
#ifndef DATA_H
#define DATA_H
#define DATAPATH "$ZFFDIR/"
#endif
EOF

echo "Compiling program..."
g++ "$ZFFDIR/main.cpp" -o "$ZFFBIN" -std=c++11 -pthread
$ZFFBIN version

echo "Finished!"
