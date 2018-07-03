#!/bin/bash - 
#===============================================================================
#
#          FILE:  compt.sh
# 
#         USAGE:  ./sec.sh 
# 
#   DESCRIPTION:  Sub-rutina de seguretat
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR: Gonçal Sallan i Baso (gsb), zonadart@autistici.org
#       COMPANY: Zona d_Art
#       CREATED: 03/07/18 11:49:04 CEST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

clear
echo "M E N U :"
echo "========="
echo
echo "***** SEGURETAT *****"
echo "dnc) Desencriptar fitxer"
echo "enc) Ecriptar fitxer"
echo "kpx) Còpia de seguretat de Keepassxc"
echo "srm) Esborrar fitxer o carpeta de forma segura"
echo "**********"
echo
echo "q) Sortir"
echo
echo "**********"

read opcio

case $opcio in

############### Desencriptar fitxer
dnc)
ls -l *.gpg
echo -n "Introdueïx nom del fitxer a desencriptar ('q' per sortir): "
read filori
if [ "$filori" = "q" ]; then
  exit
fi
filenc=${filori%%.*}
gpg --output $filenc --decrypt $filori
sh /usr/bin/zonadart/sortida.sh
;;

############### Encriptar fitxer
enc)
ls -l 
echo -n "Introdueïx nom del fitxer a encriptar ('q' per sortir): "
read filenc
if [ "$filenc" = "q" ]; then
  exit
fi
filenca=$filenc".gpg"
#echo -n "E-Mail: "
#read mail
correu="zonadart@autistici.org"
#read filori
gpg --output $filenca --encrypt --recipient $correu $filenc
#shred -u $filori
sh /usr/bin/zonadart/sortida.sh
;;

############### Còpia de seguretat de Keepassxc
kpx)
sudo rm $HOME/MEGA/MEGAsync/zonadart/documents/configuracions/debian/keepassxc/*
cp $HOME/.config/keepassxc/zonadart.kdbx $HOME/MEGA/MEGAsync/zonadart/documents/configuracions/debian/keepassxc/.
cp $HOME/.config/keepassxc/keepassxc.ini $HOME/MEGA/MEGAsync/zonadart/documents/configuracions/debian/keepassxc/.
sh /usr/bin/zonadart/sortida.sh
;;

############### Esborrar fitxer de forma segura
srm)
ls -l *
echo -n "Introdueïx nom del fitxer a esborrar ('q' per sortir): "
read caput
if [ "$caput" = "q" ]; then
  exit
fi
shred -n 10 -uvz $caput
sh /usr/bin/zonadart/sortida.sh
;;

################################################# Sortir
q)
exit
;;
########### Opció invàlida
*)
echo Opció invàlida
###########################################################
esac
