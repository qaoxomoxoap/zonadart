#!/bin/bash - 
#===============================================================================
#
#          FILE:  compt.sh
# 
#         USAGE:  ./serv.sh 
# 
#   DESCRIPTION:  Sub-rutina de servidors
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
echo "***** SERVIDORS *****"
echo "iftp) Arrancar servidor FTP"
echo "sftp) Estat del servidor FTP"
echo "oftp) Parar servidor FTP"
echo "iweb) Arrancar servidor HTTPS"
echo "sweb) Estat del servidor HTTPS"
echo "oweb) Parar servidor HTTPS"
echo "**********"
echo
echo "q) Sortir"
echo
echo "**********"

read opcio

case $opcio in


################################################# Sortirrrancar servidor HTTPS
iweb)
sudo systemctl start apache2.service
echo
echo "Servidor HTTPS arrancat correctament"
sh /usr/bin/zonadart/sortida.sh
;;
############### Estat del servidor HTTPS
sweb)
sudo systemctl status apache2.service
sh /usr/bin/zonadart/sortida.sh
;;
############### Parar servidor HTTPS
oweb)
sudo systemctl stop apache2.service
echo
echo "Servidor HTTPS aturat correctament"
sh /usr/bin/zonadart/sortida.sh
;;
############### Arrancar servidor FTP
iftp)
sudo systemctl start proftpd.service
echo
echo "Servidor FTP arrancat correctament"
sh /usr/bin/zonadart/sortida.sh
;;

############### Estat del servidor FTP
sftp)
sudo systemctl status proftpd.service
sh /usr/bin/zonadart/sortida.sh
;;
############### Parar servidor FTP
oftp)
sudo systemctl stop proftpd.service
echo
echo "Servidor FTP aturat correctament"
sh /usr/bin/zonadart/sortida.sh
;;

q)
exit
;;
########### Opció invàlida
*)
echo Opció invàlida
###########################################################
esac
