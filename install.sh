#!/bin/bash - 
#===============================================================================
#
#          FILE:  install.sh
# 
#         USAGE:  ./install.sh 
# 
#   DESCRIPTION:  Instal·lador del programa zonadart
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR: Gonçal Sallan i Baso (gsb), zonarte31@gmail.com
#       COMPANY: Zona d_Art
#       CREATED: 16/12/14 13:52:47 CET
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

# IF DEBIAN
if [ -e "/etc/debian_version" ]; then
    echo "Copying zonadart to /usr/bin/zonadart ..."
    # check for older version
    id=$(id -u)
    if [ -d "/usr/bin/zonadart/" ]; then
				sudo rm -f /usr/bin/zonadart.mnu
        sudo rm -rf /usr/bin/zonadart
    fi
    # install essential files
    sudo mkdir /usr/bin/zonadart
    sudo chown -R $id /usr/bin/zonadart
    sudo cp zonadart /usr/bin/zonadart/
		sudo cp compt.sh /usr/bin/zonadart/
		sudo cp repo.sh /usr/bin/zonadart/
		sudo cp sec.sh /usr/bin/zonadart/
		sudo cp serv.sh /usr/bin/zonadart/
		sudo cp sist.sh /usr/bin/zonadart/
		sudo cp xarx.sh /usr/bin/zonadart/
		sudo cp util.sh /usr/bin/zonadart/
		sudo cp sortida.sh /usr/bin/zonadart/
    sudo chmod +x /usr/bin/zonadart/*
    sudo ln -s /usr/bin/zonadart/zonadart /usr/bin/zonadart.mnu
fi
echo
echo "Install complete. You can close this terminal."
sleep 2
