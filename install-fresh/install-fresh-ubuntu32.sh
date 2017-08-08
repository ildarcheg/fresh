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

echo -e "\n\n\n\n- - - - - -\n\n\n\n"
echo "install tree just convenient tool"
sudo apt-get install tree

echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo "install Sublime Text 3 (run one by one)"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"

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
echo "install Midnight Commander"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"

sudo apt-get --yes --force-yes install mc

echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo "install support component (run one by one)"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"

sudo apt-get --yes --force-yes install gdebi-core
sudo apt-get --yes --force-yes install ntp ntpdate

echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo "install Apache and check status"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"

sudo apt-get --yes --force-yes install apache2
sudo service apache2 status

echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo "create subfolders and empty configs for futher infobase publications"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"

sudo mkdir -p /etc/apache2/1cfresh_a 
sudo touch /etc/apache2/1cfresh_a/empty.conf
sudo mkdir -p /etc/apache2/1cfresh_int
sudo touch /etc/apache2/1cfresh_int/empty.conf

echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo "set up default ports and ports that will be used for infobases"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"

sudo sed -i 's/^\([^#]\)/# \1/g' /etc/apache2/ports.conf
sudo echo -e "ServerName 1cfreshl32.local\nListen 80\nListen 8888\nInclude 1cfresh_a/*.conf\nInclude 1cfresh_int/*.conf" >> /etc/apache2/ports.conf

echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo "restart Apache and check status"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"

sudo service apache2 restart
sudo service apache2 status


# INSTALL POSTGRESQL
echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo "set locale and environment variable"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"

locale-gen en_US ru_RU ru_RU.UTF-8 
export LANG="ru_RU.UTF-8"

echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo "install Postgres (run one by one)"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"

yes | sudo gdebi /fresh-install/postgresql-9.3.4_1.1C_i386_deb/libicu48_4.8.1.1-3ubuntu0.7_i386.deb
echo -e "\n\n\n\n\n"
yes | sudo gdebi /fresh-install/postgresql-9.3.4_1.1C_i386_deb/libossp-uuid16_1.6.2-1.1build3_i386.deb
echo -e "\n\n\n\n\n"
yes | sudo gdebi /fresh-install/postgresql-9.3.4_1.1C_i386_deb/libpq5_9.3.4-1.1C_i386.deb
echo -e "\n\n\n\n\n"
yes | sudo gdebi /fresh-install/postgresql-9.3.4_1.1C_i386_deb/postgresql-client-9.3_9.3.4-1.1C_i386.deb
echo -e "\n\n\n\n\n"
yes | sudo gdebi /fresh-install/postgresql-9.3.4_1.1C_i386_deb/postgresql-client-common_154.1.1C_all.deb
echo -e "\n\n\n\n\n"
yes | sudo gdebi /fresh-install/postgresql-9.3.4_1.1C_i386_deb/postgresql-common_154.1.1C_all.deb
echo -e "\n\n\n\n\n"
yes | sudo gdebi /fresh-install/postgresql-9.3.4_1.1C_i386_deb/postgresql-9.3_9.3.4-1.1C_i386.deb
echo -e "\n\n\n\n\n"
yes | sudo gdebi /fresh-install/postgresql-9.3.4_1.1C_i386_deb/postgresql-contrib-9.3_9.3.4-1.1C_i386.deb

echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo "create folder for PostgreSQL databse"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"

sudo mkdir -p /1c/db

echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo "Give 'postgres' user access to folder /1c/db"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"

sudo chown postgres:postgres /1c/db

echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo "PostreSQL db initialize"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"

sudo su - postgres -c "/usr/lib/postgresql/9.3/bin/initdb -D /1c/db --locale=ru_RU.UTF-8"

echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo "replace one string with another in /etc/postgresql/9.3/main/pg_hba.conf"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"

sudo sed -i 's/local   all             postgres                                peer/local   all             postgres                                trust/' /etc/postgresql/9.3/main/pg_hba.conf

echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo "restart postgresql service"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"

sudo service postgresql restart

echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo "set up a password for postgres user"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"

sudo psql -U postgres -c "alter user postgres with password '12345Qwerty';" 

echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo "comment all lines and replace one line with these three lines"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"

sudo sed -i 's/^\([^#]\)/# \1/g' /etc/postgresql/9.3/main/pg_hba.conf
sudo sed -i 's/# local   all             postgres                                trust/local   all             postgres                                peer\nlocal   all             all                                     md5\nhost    all             postgres              127.0.0.1\/32      md5/' /etc/postgresql/9.3/main/pg_hba.conf

echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo "restart postgresql service"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"

sudo service postgresql restart


# INSTALL 1C
echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo "install 1C Server x32 (run one by one)"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"

yes | sudo gdebi /fresh-install/deb-client-server-32/1c-enterprise83-common_8.3.10-2299_i386.deb
echo -e "\n\n\n\n\n"
yes | sudo gdebi /fresh-install/deb-client-server-32/1c-enterprise83-common-nls_8.3.10-2299_i386.deb
echo -e "\n\n\n\n\n"
yes | sudo gdebi /fresh-install/deb-client-server-32/1c-enterprise83-server_8.3.10-2299_i386.deb
echo -e "\n\n\n\n\n"
yes | sudo gdebi /fresh-install/deb-client-server-32/1c-enterprise83-server-nls_8.3.10-2299_i386.deb
echo -e "\n\n\n\n\n"
yes | sudo gdebi /fresh-install/deb-client-server-32/1c-enterprise83-ws_8.3.10-2299_i386.deb
echo -e "\n\n\n\n\n"
yes | sudo gdebi /fresh-install/deb-client-server-32/1c-enterprise83-ws-nls_8.3.10-2299_i386.deb

echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo "Give 'usr1cv8' user access to folder /opt/1C"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"

sudo chown -R usr1cv8 /opt/1C

echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo "Start 1C Server and check status"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"

sudo service srv1cv83 start
sudo service srv1cv83 status

echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo "check ports listeners"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"

netstat -peant | grep :15

echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo "check ports listeners"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"

sudo netstat -peant | grep :15

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
</config>' >> /opt/1C/v8.3/xi386/conf/logcfg.xml

echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo "create folders for tech journal"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"

sudo mkdir -p /var/log/1c/logs/excp 
sudo mkdir -p /var/log/1c/logs/vrs 
sudo mkdir -p /var/log/1c/dumps

echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo "create 'grp1clogs' user group for users (apache and 1c server)"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"

sudo groupadd grp1clogs
sudo usermod -a -G grp1clogs www-data
sudo usermod -a -G grp1clogs usr1cv8

echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo "Give user group 'grp1clogs' acces to tech log folders"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"

sudo chown -R usr1cv8:grp1clogs /var/log/1c 
sudo chmod g+rw /var/log/1c

echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo "users"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"

ps aux | grep /opt/1C/v8.3/i386/ | grep -v grep | cut -c 1-65 
ps aux | grep apache2 | grep -v grep | cut -c 1-65

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


# 1C WS
echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo "Add wsap24 library to apache"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"

sudo echo "LoadModule _1cws_module /opt/1C/v8.3/i386/wsap24.so" >> /etc/apache2/mods-enabled/wsap24.load


# 1C Debug
echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo "Enable debug"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"

sudo service srv1cv83 stop
sudo sed -i 's/#SRV1CV8_DEBUG=/SRV1CV8_DEBUG=1/' /etc/init.d/srv1cv83
sudo service srv1cv83 start
sudo service srv1cv83 status
sudo systemctl daemon-reload


# INSTALL 1C CLIENT
echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo "install 1C client"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"

yes | sudo gdebi /fresh-install/deb-client-server-32/1c-enterprise83-client_8.3.10-2299_i386.deb
echo -e "\n\n\n\n\n"
yes | sudo gdebi /fresh-install/deb-client-server-32/1c-enterprise83-client-nls_8.3.10-2299_i386.deb


# INSTALL Oracle Java Runtime Environment 7
echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo "install java 7"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"

sudo cp /fresh-install/java/jdk-7u80-linux-i586.tar.gz jdk-7u80-linux-i586.tar.gz
echo "copied"
sudo tar -xvf jdk-7u80-linux-i586.tar.gz
echo "uncompressed"
sudo mkdir -p /usr/lib/jvm
echo "folder created /usr/lib/jvm"
sudo mv ./jdk1.7.0_80 /usr/lib/jvm/
echo "jdk moved"
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.7.0_80/bin/java" 1
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk1.7.0_80/bin/javac" 1
sudo update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/lib/jvm/jdk1.7.0_80/bin/javaws" 1
sudo chmod a+x /usr/bin/java
sudo chmod a+x /usr/bin/javac
sudo chmod a+x /usr/bin/javaws
sudo chown -R root:root /usr/lib/jvm/jdk1.7.0_80
java -version


# SET UP FRESH SERVER MANAGER INFOBASE
echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo "set short name for rac and ras"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"

sudo service srv1cv83 restart
sudo echo -e "\n# 1C Server Remote Admin Server\nalias mras='/opt/1C/v8.3/i386/ras'" >> ~/.profile
sudo echo -e "\n# 1C Server Remote Admin Console\nalias mrac='/opt/1C/v8.3/i386/rac'" >> ~/.profile
source ~/.profile

echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo "set up Fresh Server Infobase"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"
#sudo /fresh-install/patch-linux/1c8_uni2patch_lin /opt/1C/v8.3/i386/backbas.so 
mras cluster --daemon
cluster=$(echo $(mrac cluster list) | cut -d':' -f 2 | cut -d' ' -f 2)
echo $cluster
server=$(echo $(mrac cluster list) | cut -d':' -f 3 | cut -d' ' -f 2)
echo $server
mrac infobase create --create-database --name=sm --dbms=PostgreSQL --db-server=$server --db-name=sm --locale=en_US --db-user=postgres --db-pwd=12345Qwerty --descr='1C Fresh Manager Service Infobase' --cluster=$cluster >> infobase
infobase=$(cat infobase | cut -d':' -f 2 | cut -d' ' -f 2)
echo $infobase
rm infobase
mrac infobase summary list --cluster=$cluster
mrac infobase info --infobase=$infobase --cluster=$cluster

echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo "publish Fresh Service Infobase"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"     
sudo echo '# Service Manager External Publication (/a/adm) 
Alias "/a/adm" "/var/www/1cfresh/a/adm"
<Directory "/var/www/1cfresh/a/adm/">
    AllowOverride All
    Options None
    Order allow,deny
    Allow from all
    SetHandler 1c-application
    ManagedApplicationDescriptor "/var/www/1cfresh/a/adm/default.vrd"
</Directory>' >> /etc/apache2/1cfresh_a/adm.conf

sudo echo '# Service Manager Internal Publication (/int/sm) 
Alias "/int/sm" "/var/www/1cfresh/int/sm"
<Directory "/var/www/1cfresh/int/sm/">
    AllowOverride All
    Options None
    Order allow,deny
    Allow from all
    SetHandler 1c-application
    ManagedApplicationDescriptor "/var/www/1cfresh/int/sm/default.vrd"
</Directory>' >> /etc/apache2/1cfresh_int/sm.conf 

sudo mkdir -p /var/www/1cfresh/a/adm/
sudo mkdir -p /var/www/1cfresh/int/sm/

sudo echo '<?xml version="1.0" encoding="UTF-8"?>
<point 
    xmlns="http://v8.1c.ru/8.2/virtual-resource-system" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
    base="/a/adm" 
    ib="Srvr=&quot;1cfreshl32&quot;;Ref=&quot;sm&quot;;">
</point>' >> /var/www/1cfresh/a/adm/default.vrd

sudo echo '<?xml version="1.0" encoding="UTF-8"?>
<point 
    xmlns="http://v8.1c.ru/8.2/virtual-resource-system" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
    base="/int/sm" 
    ib="Srvr=&quot;1cfreshl32&quot;;Ref=&quot;sm&quot;;">
</point>' >> /var/www/1cfresh/int/sm/default.vrd

# 1c publication
# Alias "/new" "/var/www/1cfresh/new/"
# <Directory "/var/www/1cfresh/new/">
#     AllowOverride All
#     Options None
#     Order allow,deny
#     Allow from all
#     SetHandler 1c-application
#     ManagedApplicationDescriptor "/var/www/1cfresh/new/default.vrd"
# </Directory>

# root@1cFreshL32:~# cat /var/www/1cfresh/new/default.vrd 
# <?xml version="1.0" encoding="UTF-8"?>
# <point xmlns="http://v8.1c.ru/8.2/virtual-resource-system"
#     xmlns:xs="http://www.w3.org/2001/XMLSchema"
#     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
#     base="/new"
#     ib="Srvr=&quot;1cfreshl32&quot;;Ref=&quot;sm&quot;;">
#   <ws enable="false"/>
#   <standardOdata enable="true"
#       reuseSessions="autouse"
#       sessionMaxAge="20"
#       poolSize="10"
#       poolTimeout="5"/>


# sudo /opt/1C/v8.3/i386/1cv8 DESIGNER /F"1cFreshL32\sm" /DumpIB"my.dt" /DumpResult"log1.txt"
# cat /opt/1C/v8.3/i386/log1.txt

#x86_64

#mrac infobase create --create-database --name=s1 --dbms=PostgreSQL --db-server=1cFreshL32 --db-name=s1 --locale=en_US --db-user=postgres --db-pwd=12345Qwerty --descr='test base for testing' --cluster=cac51206-7b70-11e7-558a-001c4281f7fc

#sudo mrac infobase summary list --cluster=cac51206-7b70-11e7-558a-001c4281f7fc



