#!/bin/bash - 
#===============================================================================
#
#          FILE:  compt.sh
# 
#         USAGE:  ./xarx.sh 
# 
#   DESCRIPTION:  Sub-rutina de xarxes
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
echo "***** XARXES *****"
echo "cli) Demanar informació de web"
echo "ip) Mostrar IP pública i privada"
echo "ipcalc) Càlcul de xarxes"
echo "n-m) Configurar network manager"
echo "nm) Veure llistat d'ordinadors conectats a la xarxa"
echo "vel) Velocitat d'internet"
echo "**********"
echo
echo "q) Sortir"
echo
echo "**********"

read opcio

case $opcio in

############### Demanar informació
cli)
echo -n "Introdueïx de què vols web la informació ('q' per sortir): "
read clifiy
if [ "$clifiy" = "q" ]; then
    exit
  fi
  curl cli.fyi/$clifiy
sh /usr/bin/zonadart/sortida.sh
;;

###########Ip de xarxa
ip)
echo "IP de xarxa: "
exec /sbin/ifconfig | grep 'inet'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{print $1}'
echo "IP pública: "
exec wget -q -O - checkip.dyndns.org|sed -e 's/.*Current IP Address: //' -e 's/<.*$//'
sh /usr/bin/zonadart/sortida.sh
;;

########## Càlculs de xarxes
ipcalc)
echo -n "Introdueïx la ip de xarxa ('q:' per sortir): "
read ip
if [ "$ip" = "q" ]; then
  exit
fi
echo -n "Introdueïx la subnet ('q:' per sortir): "
read sn
if [ "$sn" = "q" ]; then
  exit
fi
ipcalc $ip/$sn
echo "-----------------------------------"
sipcalc $ip/$sn
sh /usr/bin/zonadart/sortida.sh
;;

############### Configurar Networtk-Manager
n-m)
sudo nm-connection-editor
sh /usr/bin/zonadart/sortida.sh
;;

############### LLISTAT D'ORDINADORS
nm)
sudo nmap -sP 192.168.1.1/24 | grep down -v
sh /usr/bin/zonadart/sortida.sh
;;

############### Velocitat d'Internet
vel)
speedtest-cli
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
