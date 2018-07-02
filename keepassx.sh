#!/bin/bash - 
#===============================================================================
#
#          FILE:  keepassx.sh
# 
#         USAGE:  ./keepassx.sh 
# 
#   DESCRIPTION:  
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR: Gonçal Sallan i Baso (gsb), zonadart@autistici.org
#       COMPANY: Zona d_Art
#       CREATED: 12/10/17 13:15:04 CEST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

rm /home/zonadart/MEGA/MEGAsync/zonadart/documents/configuracions/debian/keepassxc/*
cp /home/zonadart/.config/keepassxc/zonadart.kdbx /home/zonadart/MEGA/MEGAsync/zonadart/documents/configuracions/debian/keepassxc/.
cp /home/zonadart/.config/keepassxc/keepassxc.ini /home/zonadart/MEGA/MEGAsync/zonadart/documents/configuracions/debian/keepassxc/.

