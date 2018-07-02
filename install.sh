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
    echo "Copying zonadart to /usr/local/zonadart ..."
    # check for older version
    id=$(id -u)
    if [ -d "/usr/local/zonadart/" ]; then
        sudo rm -f /usr/bin/zonadart
        sudo rm -rf /usr/local/zonadart
    fi
    # install essential files
    sudo mkdir /usr/local/zonadart
    sudo chown -R $id /usr/local/zonadart
    cp zonadart /usr/local/zonadart/
    chmod +x /usr/local/zonadart/zonadart
    sudo ln -s /usr/local/zonadart/zonadart /usr/bin/zonadart
fi
echo
echo "Install complete. You can close this terminal."
sleep 2
