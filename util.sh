#!/bin/bash - 
#===============================================================================
#
#          FILE:  compt.sh
# 
#         USAGE:  ./util.sh 
# 
#   DESCRIPTION:  Sub-rutina de utilitats
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
echo "***** UTILITATS *****"
echo "cal) Mostrar almanaq"
echo "crypton) Muntar imatge encriptada dades"
echo "cryptoff) Desmuntar imatge encriptada dades"
echo "pdf) Optimitzar pdf"
echo "pi) Calcular número pi"
echo "ytb) youtube-dl - Descàrrega de videos de Youtube"
echo "**********"
echo
echo "q) Sortir"
echo
echo "**********"

read opcio

case $opcio in

############### Pi
pi)
echo -n "Introdueïx número de decimals ('q' per sortir): "
read num
if [ "$num" = "q" ]; then
    exit
  fi
time echo "scale=$num; a(1)*4" | bc -l
sh /usr/bin/zonadart/sortida.sh
;;

############### Desmuntar cryptical
cryptoff)
sudo cryptmount -u cryptical
sh /usr/bin/zonadart/sortida.sh
;;

############### Muntar cryptical
crypton)
sudo cryptmount -m cryptical
echo -n "$HOME/crypt"
sh /usr/bin/zonadart/sortida.sh
;;

###############  Esborrar un fitxer
srm)
ls -l
echo -n "Introdueïx nom del fitxer a esborrar ('q' per sortir): "
read fitxer
if [ "$fitxer" = "q" ]; then
  exit
fi
srm $fitxer
echo
echo "Fitxer esborrat correctament"
sh /usr/bin/zonadart/sortida.sh
;;

###############  youtube-dl
ytb)
echo -n "Introdueïx l'adreça del youtube ('q' per sortir): "
read video
if [ "$video" = "q" ]; then
  exit
fi
youtube-dl $video
echo
echo "Vídeo descarregat correctament"
sh /usr/bin/zonadart/sortida.sh
;;

############### Optimitzar pdf
pdf)
ls -l *.pdf
echo -n "Introdueïx nom del pdf a optimitzar ('q' per sortir): "
read fitxer
if [ "$fitxer" = "q" ]; then
  exit
fi
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dNOPAUSE -dQUIET -dBATCH -sOutputFile=optimizado.pdf $fitxer
echo
echo "Fitxer pdf optimitzat correctament"
sh /usr/bin/zonadart/sortida.sh
;;

############### ALMANAQ
cal)
ncal -3
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
