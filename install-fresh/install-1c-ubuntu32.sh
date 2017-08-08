# Install 1C Fresh Ubuntu 

# Additional information https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-16-04
# we will mix into the instructions.

# Java 7 JDK - http://www.oracle.com/technetwork/java/javase/downloads/java-archive-downloads-javase7-521261.html
# libicu48 x32 - https://launchpad.net/ubuntu/precise/i386/libicu48/4.8.1.1-3ubuntu0.7
# libicu48 x64 - https://launchpad.net/ubuntu/precise/amd64/libicu48/4.8.1.1-3
# libossp-uuid16 x32 - https://launchpad.net/ubuntu/precise/i386/libossp-uuid16/1.6.2-1.1build3
# libossp-uuid16 x64 - https://launchpad.net/ubuntu/trusty/amd64/libossp-uuid16/1.6.2-1.3ubuntu1
# cf - http://releases.1c.ru/
# postgresql x32 - https://releases.1c.ru/version_file?nick=AddCompPostgre&ver=9.3.4-1.1C&path=AddCompPostgre\9_3_4_1_1C\postgresql-9.3.4_1.1C_i386_deb.tar.bz2
# postgresql x64 - https://releases.1c.ru/version_file?nick=AddCompPostgre&ver=9.3.4-1.1C&path=AddCompPostgre\9_3_4_1_1C\postgresql-9.3.4_1.1C_amd64_deb.tar.bz2
# hasp x32 - http://ftp.etersoft.ru/pub/Etersoft/HASP/last/Ubuntu/16.04/
# hasp x64 - http://ftp.etersoft.ru/pub/Etersoft/HASP/last/x86_64/Ubuntu/16.04/
# JDBC driver for PostgreSQL (9.3-1104 JDBC 4) - https://jdbc.postgresql.org/download.html


# INSTALL CONVENIENT TOOLS
echo -e "\n\n\n\n- - - - - -\n\n\n\n"
echo "Set up an evvironment"

echo -e "\n\n\n\n- - - - - -\n\n\n\n"
echo "update installed packages before adding new ones"
cd
sudo apt-get update -y

sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get install -y sublime-text-installer


# PREPARE INSTALLATION FOLDER
echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo "copy install folder"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"

sudo cp -a /media/psf/baseQI/fresh-install-32 /fresh-install
#/fresh-install/
# ├── cf
# │   └── UNF_1_6_10_55.cf
# ├── deb-client-server-32
# │   ├── 1c-enterprise83-client_8.3.10-2299_i386.deb
# │   ├── 1c-enterprise83-client-nls_8.3.10-2299_i386.deb
# │   ├── 1c-enterprise83-common_8.3.10-2299_i386.deb
# │   ├── 1c-enterprise83-common-nls_8.3.10-2299_i386.deb
# │   ├── 1c-enterprise83-crs_8.3.10-2299_i386.deb
# │   ├── 1c-enterprise83-server_8.3.10-2299_i386.deb
# │   ├── 1c-enterprise83-server-nls_8.3.10-2299_i386.deb
# │   ├── 1c-enterprise83-thin-client_8.3.10-2299_i386.deb
# │   ├── 1c-enterprise83-thin-client-nls_8.3.10-2299_i386.deb
# │   ├── 1c-enterprise83-ws_8.3.10-2299_i386.deb
# │   └── 1c-enterprise83-ws-nls_8.3.10-2299_i386.deb
# ├── hasp
# │   └── haspd_7.40-eter10ubuntu_i386.deb
# ├── java
# │   └── jdk-7u80-linux-i586.tar.gz
# ├── postgresql-9.3.4_1.1C_i386_deb
# │   ├── libicu48_4.8.1.1-3ubuntu0.7_i386.deb
# │   ├── libossp-uuid16_1.6.2-1.1build3_i386.deb
# │   ├── libpq5_9.3.4-1.1C_i386.deb
# │   ├── postgresql-9.3_9.3.4-1.1C_i386.deb
# │   ├── postgresql-client-9.3_9.3.4-1.1C_i386.deb
# │   ├── postgresql-client-common_154.1.1C_all.deb
# │   ├── postgresql-common_154.1.1C_all.deb
# │   └── postgresql-contrib-9.3_9.3.4-1.1C_i386.deb
# └── postgresql-jar
#     └── postgresql-9.3-1104.jdbc4.jar


# INSTALL APACHE, CREATE FOLDERS
echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo "install support component (run one by one)"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"

sudo apt-get --yes --force-yes install gdebi-core
sudo apt-get --yes --force-yes install ntp ntpdate

echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo "install imagemagick"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"

sudo apt-get -y install imagemagick
sudo find / -xdev -name "*libMagickWand*"

echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo "create a link to libMagickWand.so"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"

sudo ln -s /usr/lib/i386-linux-gnu/libMagickWand-6.Q16.so.2.0.0 /usr/lib/libMagickWand.so

echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo "install ms fonts"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"

sudo apt-get -y install ttf-mscorefonts-installer
sudo fc-cache -fv
sudo ln -s /etc/fonts/conf.avail/10-autohint.conf /etc/fonts/conf.d/


# HASP
echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo ""
echo -e "\n\n\n\n- - - - - -\n\n\n\n"

sudo apt-get -y install libc6:i386
yes | sudo gdebi /fresh-install/hasp/haspd_7.40-eter10ubuntu_i386.deb

echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo "Start HASP and check status"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"

sudo service haspd start
sudo service haspd status


# INSTALL 1C CLIENT
echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo "install 1C client"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"

yes | sudo gdebi /fresh-install/deb32/1c-enterprise83-common_8.3.10-2505_i386.deb
printf '\n%.0s' {1..5}
yes | sudo gdebi /fresh-install/deb32/1c-enterprise83-common-nls_8.3.10-2505_i386.deb
printf '\n%.0s' {1..5}
yes | sudo gdebi /fresh-install/deb32/1c-enterprise83-server_8.3.10-2505_i386.deb
printf '\n%.0s' {1..5}
yes | sudo gdebi /fresh-install/deb32/1c-enterprise83-server-nls_8.3.10-2505_i386.deb
printf '\n%.0s' {1..5}
yes | sudo gdebi /fresh-install/deb32/1c-enterprise83-ws_8.3.10-2505_i386.deb
printf '\n%.0s' {1..5}
yes | sudo gdebi /fresh-install/deb32/1c-enterprise83-ws-nls_8.3.10-2505_i386.deb
printf '\n%.0s' {1..5}
yes | sudo gdebi /fresh-install/deb32/1c-enterprise83-client_8.3.10-2505_i386.deb
printf '\n%.0s' {1..5}
yes | sudo gdebi /fresh-install/deb32/1c-enterprise83-client-nls_8.3.10-2505_i386.deb

sudo /fresh-install/patch-linux/1c8_uni2patch_lin /opt/1C/v8.3/i386/backbas.so 

echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo "create conf file for tech journal"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"

sudo mkdir -p /opt/1C/v8.3/i386/conf
sudo echo '<?xml version="1.0"?>
<config xmlns="http://v8.1c.ru/v8/tech-log">
  <log location="/var/log/1c/logs/excp" history="24">
    <event>
      <eq property="name" value="excp"/>
    </event>
    <property name="all"/>
  </log>
  <log location="/var/log/1c/logs/vrs" history="24">
    <event>
      <eq property="name" value="vrsrequest"/>
    </event>
    <event>
      <eq property="name" value="vrsresponse"/>
    </event>
    <property name="all"/>
  </log>
  <dump location="/var/log/1c/dumps" create="1" type="3"/> 
</config>' > /opt/1C/v8.3/xi386/conf/logcfg.xml

echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo "create folders for tech journal"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"

sudo mkdir -p /var/log/1c/logs/excp 
sudo mkdir -p /var/log/1c/logs/vrs 
sudo mkdir -p /var/log/1c/dumps

# sudo /opt/1C/v8.3/i386/1cv8 DESIGNER /F"1cFreshL32\sm" /DumpIB"my.dt" /DumpResult"log1.txt"
# cat /opt/1C/v8.3/i386/log1.txt
# /home/ildar/Documents/Demo

#x86_64

#mrac infobase create --create-database --name=s1 --dbms=PostgreSQL --db-server=1cFreshL32 --db-name=s1 --locale=en_US --db-user=postgres --db-pwd=12345Qwerty --descr='test base for testing' --cluster=cac51206-7b70-11e7-558a-001c4281f7fc

#sudo mrac infobase summary list --cluster=cac51206-7b70-11e7-558a-001c4281f7fc


