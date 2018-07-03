#!/bin/bash - 
#===============================================================================
#
#          FILE:  compt.sh
# 
#         USAGE:  ./repo.sh 
# 
#   DESCRIPTION:  Sub-rutina de repositoris
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
echo "***** REPOSITORIS I APT *****"
echo "deb) Asegurar l'autenticitat dels servidors d'actualització de Debian"
echo "purge) Netejar fitxers de configuració de paquets desinst"
echo "**********"
echo
echo "q) Sortir"
echo
echo "**********"

read opcio

case $opcio in

###############  Asegurar l'autenticitat dels servidors d'actualització de Debian
deb)
echo -n "introdueïx codi GPG error ('q' per sortir): "
read code
if [ "$code" = "q" ]; then
  exit
fi
gpg --keyserver pgpkeys.mit.edu --recv-key $code
gpg -a --export $code | sudo apt-key add -
echo "Clau GPG actualitzada"
sh /usr/bin/zonadart/sortida.sh
;;

############### Purgar fitxer de configuració
purge)
sudo dpkg --purge `COLUMNS=300 dpkg -l | egrep "^rc" | cut -d' ' -f3`
echo "Fitxers purgats correctament"
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
