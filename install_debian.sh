#!/bin/bash - 
#===============================================================================
#
#          FILE:  install_debian_jessie_phoenix.sh
# 
#         USAGE:  ./install_debian_jessie_phoenix.sh 
# 
#   DESCRIPTION:  Configuració Debian Jessie a phoenix
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR: Gonçal Sallan i Baso (gsb), zonadart@autistici.org
#       COMPANY: Zona d_Art
#       CREATED: 20/04/15 17:30:55 CEST
#      REVISION:  ---
#===============================================================================
#http://blog.desdelinux.net/instalacion-configuracion-debian-8-gnome/

set -o nounset                              # Treat unset variables as an error

su

aptitude install apt-transport-https
aptitude update
aptitude install deb-multimedia-keyring

mv /etc/apt /etc/apt_bak
cp -R apt_jessie/apt /etc/apt
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E985B27B
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0F164EEB
aptitude update && aptitude upgrade -y
rm -R /etc/apt_bak

aptitude install ssh terminator vim fontconfig-infinality

#http://www.webupd8.org/2013/06/better-font-rendering-in-linux-with.html
bash /etc/fonts/infinality/infctl.sh setstyle

aptitude install linux-headers-$(uname -r) build-essential checkinstall make automake cmake autoconf git git-core autogen libtool

aptitude install nvidia-kernel-dkms nvidia-driver firmware-ralink 

#################################################################################
#Open a Terminal

#Login as root : su

#go to sources.list: nano /etc/apt/sources.list
#paste the source: 

# deb http://http.debian.net/debian/ jessie main contrib non-free

#hit Ctrl+o to overwrite and Ctrl+x to get out.

#update your sources.list: 

apt-get update

#Install nvidia driver:

apt-get install nvidia-glx nvidia-kernel-dkms nvidia-xconfig nvidia-settings

#after is done paste nvidia-xconfig to create a X file and reboot.

#Done 

vim /etc/modprobe.d/fbdev-blacklist.conf

blacklist nouveau
#################################################################################

aptitude install mate-desktop-environment-extras
aptitude install mate-system-tools gnome-disk-utility

#http://isp-control.net/forum/printthread.php?tid=6211

aptitude install ufw

ufw default deny
ufw enable
ufw logging on
ufw allow ssh
ufw allow http
ufw allow https
ufw allow 51413
ufw allow 8200
ufw allow from 192.168.1.0/24

#https://wiki.debian.org/NvidiaGraphicsDrivers#Debian_8_.22Jessie.22
cp xorg.conf /etc/X11/.
chown root:root /etc/X11/xorg.conf

cp -R .vim ~/.
chown -R root:root ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc

aptitude install openjdk-7-jre 

aptitude install rar unrar arj lhasa liblhasa0 lzip zip unzip unace bzip2 lzop p7zip-full p7zip-rar 

aptitude install fonts-cantarell fonts-mathjax fonts-noto otf-stix ttf-freefont ttf-mscorefonts-installer ttf-bitstream-vera ttf-dejavu ttf-liberation 

aptitude install python-software-properties software-properties-common gdebi transmission-gtk xdg-user-dirs cups simple-scan wine winetricks wakeonlan gparted g++-4.9-multilib g++-multilib gcc-4.9-multilib gcc-multilib giflib-tools lshw lshw-gtk hardinfo sysinfo smartmontools


wget https://github.com/adobe-fonts/source-code-pro/archive/1.017R.zip && unzip 1.017R.zip && sudo mv source-code-pro-1.017R/OTF/*.otf /usr/local/share/fonts/ && fc-cache -f -v && rm 1.017R.zip && rm -Rf source-code-pro-1.017R

aptitude install kdenlive mediainfo mediainfo-gui subversion git cmake build-essential yasm libqt4-dev kdelibs5-dev libsdl1.2-dev libsdl-image1.2-dev libxml2-dev libx264-dev libtheora-dev libxvidcore-dev libogg-dev libvorbis-dev libschroedinger-dev libmp3lame-dev libfaac-dev libfaad-dev libgsm1-dev libopencore-amrnb-dev libopencore-amrwb-dev libsamplerate0-dev libjack-dev libsox-dev ladspa-sdk swh-plugins libmad0-dev libpango1.0-dev ffmpeg2theora gstreamer1.0-alsa gstreamer1.0-clutter gstreamer1.0-fluendo-mp3 gstreamer1.0-libav gstreamer1.0-nice gstreamer1.0-plugins-bad gstreamer1.0-pulseaudio pavucontrol gstreamer1.0-vaapi libclutter-1.0-0 libclutter-1.0-common libcogl-common libcogl-pango20 libcogl-path20 libcogl20 libgstreamer-plugins-bad1.0-0 libgstreamer-vaapi1.0-0 libgtkglext1 libgupnp-igd-1.0-4 libinput5 libnice10 liboggkate1 libopencv-calib3d2.4 libopencv-contrib2.4 libopencv-core2.4 libopencv-features2d2.4 libopencv-flann2.4 libopencv-highgui2.4 libopencv-imgproc2.4 libopencv-legacy2.4 libopencv-ml2.4 libopencv-objdetect2.4 libopencv-video2.4 libsbc1 libtbb2 libva-glx1 libva-wayland1 lsdvd

apt-get build-dep mlt

apt install icedove icedove-calendar-exchange-provider icedove-enigmail icedove-l10n-ca lightning-l10n-ca
# gpg-agent --daemon thunderbird
# menu d'inici de thunderbird/icedove

#https://colaboratorio.net/enrique/program/2017/readymedia-servidor-dlna-ligero-practico/
apt install minidlna

vim /etc/minidlna.conf

friendly_name=Prometheus
media_dir=/home/zonadart

systemctl start minidlna
systemctl enable minidlna

#http://www.webupd8.org/2014/03/how-to-install-oracle-java-8-in-debian.html
aptitude install oracle-java8-installer oracle-java8-set-default

#https://wiki.debian.org/es/NTP
aptitude install ntp
ntpq -p

#Escaner
dpkg -i DEBS/scanner/*.deb
aptitude install xsltproc

#Software
aptitude install meld calibre evince tree freecad librecad inkscape gpicview xsane audacity gtick tuxguitar tuxguitar-alsa tuxguitar-oss tuxguitar-jsa timidity timidity-interfaces-extra lyx tex4ht texlive-latex-base texlive-latex-extra texlive-fonts-extra lilypond lilypond-doc-pdf-es lilypond-doc-html-es musixtex bluefish gambas3 geany geany geany-plugins geany-plugins-common geany-plugin-addons filezilla hugin gthumb htop atop bleachbit pdfmod pyrenamer easytag unison-all-gtk unison-all brasero cd-discid cdparanoia flac lame normalize-audio ruby-gnome2 ruby vorbisgain ripperx sound-juicer k3b k3b-extrathemes k3b-i18n libk3b6 libk3b6-extracodecs transcode transcode-utils moc browser-plugin-vlc nmap nast wireshark kfind blender seahorse

aptitude -t jessie-backports install musescore keepassx darktable

#https://github.com/micahflee/torbrowser-launcher/blob/master/BUILD.md
git clone https://github.com/micahflee/torbrowser-launcher.git
cd torbrowser-launcher
apt-get install build-essential dh-python python-all python-stdeb python-gtk2 python-twisted python-lzma
./build_deb.sh
dpkg -i deb_dist/torbrowser-launcher_*.deb

#https://lin4all.wordpress.com/2015/07/19/instalar-tema-y-pack-de-iconos-numix-en-ubuntudebian/
apt-get install gtk2-engines-murrine
apt-get install numix-gtk-theme numix-icon-theme numix-icon-theme-circle numix-icon-theme-bevel

#http://www.tecmint.com/install-mariadb-in-debian/
aptitude install mariadb-server mariadb-client apache2 php7.2 php7.2-cli php7.2-common php7.2-curl php7.2-gd php7.2-opcache php7.2-readline php7.2-intl php7.2-json php7.2-mbstring php7.2-soap php7.2-xml php7.2-xmlrpc php7.2-zip libapache2-mod-php7.2 phpmyadmin phppgadmin

#https://www.digitalocean.com/community/tutorials/how-to-create-a-ssl-certificate-on-apache-for-debian-7
a2ensite default-ssl
a2enmod ssl
a2enmod rewrite
systemctl restart apache2
mkdir /etc/apache2/ssl
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/apache2/ssl/apache.key -out /etc/apache2/ssl/apache.crt

vim /etc/apache2/sites-available/default-ssl.conf
- ServerName example.com:443
- SSLEngine on
- SSLCertificateFile /etc/apache2/ssl/apache.crt
- SSLCertificateKeyFile /etc/apache2/ssl/apache.key

#https://www.diigo.com/user/zonarte31/b/389584238
vim /etc/apache2/sites-available/000-default.conf
<VirtualHost *:80>
  # The ServerName directive sets the request scheme, hostname and port that
  # the server uses to identify itself. This is used when creating
  # redirection URLs. In the context of virtual hosts, the ServerName
  # specifies what hostname must appear in the request's Host: header to
  # match this virtual host. For the default virtual host (this file) this
  # value is not decisive as it is used as a last resort host regardless.
  # However, you must set it for any further virtual host explicitly.
  #ServerName www.example.com

##  ServerAdmin webmaster@localhost
##  DocumentRoot /var/www/html

  # Available loglevels: trace8, ..., trace1, debug, info, notice, warn,
  # error, crit, alert, emerg.
  # It is also possible to configure the loglevel for particular
  # modules, e.g.
  #LogLevel info ssl:warn

##  ErrorLog ${APACHE_LOG_DIR}/error.log
##  CustomLog ${APACHE_LOG_DIR}/access.log combined

  # For most configuration files from conf-available/, which are
  # enabled or disabled at a global level, it is possible to
  # include a line for only one particular virtual host. For example the
  # following line enables the CGI configuration for this host only
  # after it has been globally disabled with "a2disconf".
  #Include conf-available/serve-cgi-bin.conf

       RewriteEngine On
       RewriteRule ^(.*)$ https://%{HTTP_HOST}$1 [R=301,L]

</VirtualHost>

#http://kimbriggs.com/computers/computer-notes/linux-notes/apache2-public_html-virtual-directories.file
#http://stackoverflow.com/questions/4258037/error-403-forbidden-at-users-encrypted-public-html-directory
mkdir ~/public_html
cd /etc/apache2/mods-enabled
sudo ln -s ../mods-available/userdir.conf userdir.conf
sudo ln -s ../mods-available/userdir.load userdir.load
sudo systemctl restart apache2

sudo vim /etc/apache2/mods-enabled/userdir.conf
###
<IfModule mod_userdir.c>
    UserDir public_html
    UserDir disabled root

    <Directory /home/*/public_html>
            AllowOverride All
            Options MultiViews Indexes SymLinksIfOwnerMatch IncludesNoExec
                            Allow from all
                            Order allow,deny
                            Require all granted
            <Limit GET POST OPTIONS>
                    Order allow,deny
                    Allow from all
                    Require all granted
            </Limit>
            <LimitExcept GET POST OPTIONS>
                    Order deny,allow
                    Deny from all
                    Require all denied
            </LimitExcept>
    </Directory>
</IfModule>
###

sudo vim /etc/apache2/mods-enabled/php7.0.conf
###
#<IfModule mod_userdir.c>
#    <Directory /home/*/public_html>
#        php_admin_value engine Off
#    </Directory>
#</IfModule>
###

systemctl restart apache2

### POSTGRES
#http://www.nanotutoriales.com/instalacion-de-postgresql-server
#http://www.nanotutoriales.com/como-crear-un-usuario-y-asignarle-permisos-en-postgresql
apt-get install postgresql postgresql-client
su postgres
psql
ALTER USER postgres WITH PASSWORD '<password>';
\q
psql -U postgres -W -h localhost;
CREATE USER zonadart PASSWORD 'password';
ALTER ROLE zonadart WITH SUPERUSER;
CREATE DATABASE abanq WITH OWNER zonadart;
GRANT ALL PRIVILEGES ON DATABASE abanq TO zonadart;
\q
exit

### SAMBA
#http://unbrutocondebian.blogspot.com.es/2014/10/compartiendo-con-samba-de-manera-facil.html
aptitude install samba samba-client
aptitude install python-glade2 python-libuser
dpkg -i DEBS/samba/python-central_0.6.17ubuntu2_all.deb
dpkg -i DEBS/samba/system-config-samba_1.2.63-0ubuntu6_all.deb
touch /etc/libuser.conf

### PDFEDITOR (comprovar versió)
#http://code-industry.net/free-pdf-editor.php
dpkg -i DEBS/pdfeditor/master-pdf-editor_2.2.15_i386.deb

aptitude update && aptitude upgrade

#youtube-dl
#http://rg3.github.io/youtube-dl/download.html
wget https://github.com/rg3/youtube-dl/releases/download/2016.06.25/youtube-dl -O /usr/local/bin/youtube-dl
chmod a+x /usr/local/bin/youtube-dl

exit

#http://www.dailylinuxnews.com/blog/2014/09/ubuntu-like-debian-font-rendering-using-infinality-font/
echo "Xft.lcdfilter: lcddefault" >> ~/.Xresources

cp -R .vim ~/.
ln -s ~/.vim/vimrc ~/.vimrc

cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86" | tar xzf -
#/home/zonadart/.dropbox-dist/dropboxd

cp -R keepassx ~/.config/.
cp -R signatures ~/.signatures
cp -R autostart ~/.config/.

su
reboot

################################################################################
### INSTAL·LACIÓ BASE
# Eines impressindibles
aptitude install preload wget nano git mercurial make pulseaudio libcanberra-pulse mpg123 libldap-2.4-2 libpulse0 libxml2 giflib-tools libpng3 libc6 gtk2-engines gcc gcc-multilib g++ g++-multilib cmake gtk+2.0 gtk+3.0 lm-sensors hddtemp

# Compressió i descompressió
aptitude install rar unrar p7zip p7zip-full p7zip-rar unace zip unzip bzip2 arj lhasa lzip xz-utils

# Còdecs
aptitude install ffmpeg2theora ffmpegthumbnailer gstreamer1.0-clutter-3.0 gstreamer1.0-plugins-base gstreamer1.0-nice gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-fluendo-mp3 gstreamer1.0-alsa gstreamer1.0-pulseaudio gstreamer1.0-libav gstreamer1.0-vaapi

# Suport per DVD
aptitude install lsdvd libdvdread4 libdvdnav4

# Tipografies adicionals
aptitude install fonts-cantarell fonts-liberation fonts-noto ttf-mscorefonts-installer ttf-dejavu fonts-stix otf-stix fonts-oflb-asana-math fonts-mathjax

wget https://github.com/adobe-fonts/source-code-pro/archive/1.017R.zip && unzip 1.017R.zip && sudo mv source-code-pro-1.017R/OTF/*.otf /usr/local/share/fonts/ && fc-cache -f -v && rm 1.017R.zip && rm -Rf source-code-pro-1.017R

### TARJA GRÀFICA
# ATI
# https://wiki.debian.org/es/ATIProprietary

aptitude install mesa-utils mesa-utils-extra libegl1-mesa libegl1-mesa-drivers libgl1-mesa-dri libglapi-mesa libgles1-mesa libgles2-mesa libglu1-mesa libopenvg1-mesa mesa-vdpau-drivers libtxc-dxtn-s2tc0 libtxc-dxtn-s2tc-bin uuid-runtime

# NVIDIA
apt remove xserver-xorg-video-nouveau

apt install linux-headers-$(uname -r|sed 's,[^-]*-[^-]*-,,') nvidia-kernel-dkms nvidia-glx nvidia-kernel-common nvidia-xconfig nvidia-settings nvidia-vdpau-driver libgl1-nvidia-glx libgl1-nvidia-glx-i386 libtxc-dxtn-s2tc0 libtxc-dxtn-s2tc-bin libtxc-dxtn-s2tc0:i386 nvidia-cg-toolkit uuid-runtime

nvidia-xconfig

systemctl reboot

sensors-detect

dpkg-reconfigure locales

vim /etc/inputrc

  # set convert-meta off ===> set convert-meta off

vim /etc/environment

  ca_ES.UTF-8
  LANG=ca_ES.UTF-8
  LANGUAGE=ca_ES
  LC_ALL=ca_ES
  LC_TYPE=ca_ES
  export LANG
  export LANGUAGE
  export LC_ALL
  export LC_TYPE

vim /etc/profile

  ca_ES.UTF-8
  LANG=ca_ES.UTF-8
  LANGUAGE=ca_ES
  LC_ALL=ca_ES
  LC_TYPE=ca_ES
  export LANG
  export LANGUAGE
  export LC_ALL
  export LC_TYPE

vim /etc/pulse/default.pa

  load-module module-role-cork ===> #load-module module-role-cork

#Renderitzat de fonts
#http://blog.desdelinux.net/mejora-las-tipografias-en-debian-sin-infinality/

# HASKELL

apt install haskell-platform postgresql

cabal update

cabal install stylish-haskell

cabal install ghc-mod

#https://atom.io/
wget https://atom.io/download/deb

apm install seti-ui seti-syntax


