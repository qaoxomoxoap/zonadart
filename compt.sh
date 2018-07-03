#!/bin/bash - 
#===============================================================================
#
#          FILE:  compt.sh
# 
#         USAGE:  ./compt.sh 
# 
#   DESCRIPTION:  Sub-rutina de comptabilitat
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
echo "***** COMPTABILITAT *****"
echo "abanq) Restaurar copia de seguretat"
echo "eneboo) Esborrar copia de seguretat sobrant"

echo "**********"
echo
echo "q) Sortir"
echo
echo "**********"

read opcio

case $opcio in

############### Gestionar copia de seguretat Eneboo
eneboo)
ls -l $HOME/MEGA/MEGAsync/zonadart/documents/sec/comptabilitat/*.sql
echo -n "Introdueïx copia de seguretat a esborrar ('q' per sortir): "
read copy
if [ "$copy" = "q" ]; then
  exit
fi
rm $copy
echo
echo "Copia de Seguretat Esborrada Correctament"
sh /usr/bin/zonadart/sortida.sh
;;

############### Restaurar copia de seguretat Abanq
abanq)
ls -l $HOME/MEGA/MEGAsync/zonadart/documents/sec/comptabilitat/*.sql
dropdb abanq -U zonadart
createdb abanq -U zonadart -E UNICODE
echo -n "Introdueïx copia de seguretat a restaurar ('q' per sortir): "
read copia
if [ "$copia" = "q" ]; then
  exit
fi
psql -d abanq -U zonadart -f $copia
echo
echo "Base Restaurada Correctament"
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
