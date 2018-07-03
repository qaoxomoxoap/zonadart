#!/bin/bash - 
#===============================================================================
#
#          FILE:  compt.sh
# 
#         USAGE:  ./sist.sh 
# 
#   DESCRIPTION:  Sub-rutina de sistema
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
echo "***** SISTEMA  *****"
echo "font) Actualitzar catxé de fonts"
echo "hd) Llista dels discs durs"
echo "inf) Sistema de fonts infinality"
echo "iso) Muntar o desmuntar ISO's al disc dur"
echo "man) Ajuda de comandes de terminal"
echo "mem) Alliberar memòria RAM i SWAP"
echo "prelink) Optimitzar sistema"
echo "srv) Activar server de python"
echo "status) Estat General de l'Ordinador"
echo "**********"
echo
echo "q) Sortir"
echo
echo "**********"

read opcio

case $opcio in

############### Actualitzar catxé de fonts
font)
sudo fc-cache -f -v
sh /usr/bin/zonadart/sortida.sh
;;

############### Llistat particions disc dur
hd)
lsblk -f
sh /usr/bin/zonadart/sortida.sh
;;

###############  infinality
inf)
sudo bash /etc/fonts/infinality/infctl.sh setstyle
sh /usr/bin/zonadart/sortida.sh
;;

########### Muntar i desmuntar ISO's al disc dur
iso)
echo
echo "MENU"
echo "mnt) Muntar ISO"
echo "umnt) Desmuntar ISO"
echo "q) Sortir"
echo
read isoption
case $isoption in
mnt)
echo -n "Introdueïx el fitxer ISO ('q:' per sortir): "
read iso
if [ "$iso" = "q" ]; then
  exit
fi
sudo mount -t iso9660 -o loop $iso /media/zonadart/ISO/
echo
echo "ISO muntada correctament a /media/zonadart/ISO/"
sh /usr/bin/zonadart/sortida.sh
;;
umnt)
sudo umount /media/zonadart/ISO/
esac
sh /usr/bin/zonadart/sortida.sh
;;

###############  Manual simple de terminal
man)
echo -n "Introdueïx el nom del comande a consultar ('q' per sortir): "
read comande
if [ "$comande" = "q" ]; then
  exit
fi
tldr $comande
sh /usr/bin/zonadart/sortida.sh
;;

############### Alliberar memòria
mem)
echo -e "\nEstat Actual de memoria: "
free -h
sudo swapoff -a ; sudo swapon -a
echo
sudo sync && sudo sysctl -w vm.drop_caches=3
echo -e "\nEstat desprès d'alliberar memòria: "
free -h
echo "Memòria RAM i SWAP Alliberada Correctament"
sh /usr/bin/zonadart/sortida.sh
;;

############### prelink - https://ubunlog.com/mejora-el-funcionamiento-de-tu-sistema-y-aplicaciones-con-preload-y-prelink/
prelink)
sudo prelink -amvR
sh /usr/bin/zonadart/sortida.sh
;;

############### Activar server de python
srv)
echo "Introdueïx al navegador" $HOSTNAME":9500"
echo "Per sortir, Ctrl+c"
python -m SimpleHTTPServer 9500
sh /usr/bin/zonadart/sortida.sh
;;

############### Estat General de l'Ordinador
status)
echo "=================================="
echo "Instal·la lm-sensors i hddtemp"
echo "=================================="
# Definim colors
rojo='\033[0;31m'
rojoI='\033[1;31m'
rosaI="\033[1;35m"
amarillo='\033[1;33m'
cian='\033[1;36m'
azul='\033[0;34m'
verde='\033[1;32m'
destaca='\033[1;38m'
NC='\033[0m' # No Color
printf "${cian}"
echo "=================================="
printf "${NC}"
sudo sensors
printf "${cian}"
echo "=================================="
printf "${NC}"
sudo hddtemp /dev/sda
sudo hddtemp /dev/sdb
printf "${cian}"
echo "=================================="
printf "${NC}"
sudo free -h
printf "${cian}"
echo "=================================="
printf "${NC}"
sudo uptime
printf "${cian}"
echo "=================================="
printf "${NC}"
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
