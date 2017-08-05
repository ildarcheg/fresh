# Install 1C Fresh Ubuntu 

# Additional information https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-16-04
# we will mix into the instructions.

# INSTALL CONVENIENT TOOLS
echo -e "\n- - - - - -\n"
echo "Set up an evvironment"

echo -e "\n- - - - - -\n"
echo "update installed packages before adding new ones"
cd
sudo apt-get update -y

echo -e "\n- - - - - -\n"
echo "install tree just convenient tool"
sudo apt-get install tree

printf '\n%.0s' {1..10}
echo -e "\n- - - - - -\n"
echo "install Sublime Text 3 (run one by one)"
echo -e "\n- - - - - -\n"
printf '\n%.0s' {1..2}
sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get install -y sublime-text-installer

# PREPARE INSTALLATION FOLDER
printf '\n%.0s' {1..10}
echo -e "\n- - - - - -\n"
echo "copy install folder"
echo -e "\n- - - - - -\n"
printf '\n%.0s' {1..2}
sudo cp -a /media/psf/baseQI/fresh-install /fresh-install
#/fresh-install/
#├── cf
#│   └── UNF_1_6_10_55.cf
#├── deb-client-server-32
#│   ├── 1c-enterprise83-client_8.3.10-2299_i386.deb
#│   ├── 1c-enterprise83-client-nls_8.3.10-2299_i386.deb
#│   ├── 1c-enterprise83-common_8.3.10-2299_i386.deb
#│   ├── 1c-enterprise83-common-nls_8.3.10-2299_i386.deb
#│   ├── 1c-enterprise83-crs_8.3.10-2299_i386.deb
#│   ├── 1c-enterprise83-server_8.3.10-2299_i386.deb
#│   ├── 1c-enterprise83-server-nls_8.3.10-2299_i386.deb
#│   ├── 1c-enterprise83-thin-client_8.3.10-2299_i386.deb
#│   ├── 1c-enterprise83-thin-client-nls_8.3.10-2299_i386.deb
#│   ├── 1c-enterprise83-ws_8.3.10-2299_i386.deb
#│   └── 1c-enterprise83-ws-nls_8.3.10-2299_i386.deb
#├── fresh-1c
#│   ├── Fresh_availability-1.1.5.zip
#│   ├── Fresh_forum_1.0.35.1.zip
#│   ├── Fresh_site_1.0.58.1.zip
#│   ├── Fresh_Демо-приложение.Работа.в.модели.сервиса_1.0.4.2_setup1c.zip
#│   ├── Fresh_Менеджер.доступности_1.0.2.8_setup1c.zip
#│   ├── Fresh_Менеджер.сервера_1.0.71.36_setup1c.zip
#│   └── Fresh_Шлюз.приложений_appgate-1.1.1.4-1.deb
#├── hasp
#│   └── haspd_7.40-eter10ubuntu_i386.deb
#├── postgresql-9.3.4_1.1C_i386_deb
#│   ├── libicu48_4.8.1.1-3ubuntu0.7_i386.deb
#│   ├── libossp-uuid16_1.6.2-1.1build3_i386.deb
#│   ├── libpq5_9.3.4-1.1C_i386.deb
#│   ├── postgresql-9.3_9.3.4-1.1C_i386.deb
#│   ├── postgresql-client-9.3_9.3.4-1.1C_i386.deb
#│   ├── postgresql-client-common_154.1.1C_all.deb
#│   ├── postgresql-common_154.1.1C_all.deb
#│   └── postgresql-contrib-9.3_9.3.4-1.1C_i386.deb
#└── postgresql-jar
#    └── postgresql-9.3-1104.jdbc4.jar

# INSTALL APACHE, CREATE FOLDERS
printf '\n%.0s' {1..10}
echo -e "\n- - - - - -\n"
echo "install Midnight Commander"
echo -e "\n- - - - - -\n"
printf '\n%.0s' {1..2}
sudo apt-get --yes --force-yes install mc

printf '\n%.0s' {1..10}
echo -e "\n- - - - - -\n"
echo "install support component (run one by one)"
echo -e "\n- - - - - -\n"
printf '\n%.0s' {1..2}
sudo apt-get --yes --force-yes install gdebi-core
sudo apt-get --yes --force-yes install ntp ntpdate


printf '\n%.0s' {1..10}
echo -e "\n- - - - - -\n"
echo "install Apache and check status"
echo -e "\n- - - - - -\n"
printf '\n%.0s' {1..2}
sudo apt-get --yes --force-yes install apache2
sudo service apache2 status

printf '\n%.0s' {1..10}
echo -e "\n- - - - - -\n"
echo "create subfolders and empty configs for futher infobase publications"
echo -e "\n- - - - - -\n"
printf '\n%.0s' {1..2}
mkdir -p /etc/apache2/1cfresh_a 
touch /etc/apache2/1cfresh_a/empty.conf
mkdir -p /etc/apache2/1cfresh_int
touch /etc/apache2/1cfresh_int/empty.conf

printf '\n%.0s' {1..10}
echo -e "\n- - - - - -\n"
echo "set up default ports and ports that will be used for infobases"
echo -e "\n- - - - - -\n"
printf '\n%.0s' {1..2}
sudo cp /etc/apache2/ports.conf /etc/apache2/ports.bak.conf
sudo echo -e "ServerName 1cfreshl.local\nListen 80\nListen 8888\nInclude 1cfresh_a/*.conf\nInclude 1cfresh_int/*.conf" > /etc/apache2/ports.conf

printf '\n%.0s' {1..10}
echo -e "\n- - - - - -\n"
echo "restart Apache and check status"
echo -e "\n- - - - - -\n"
printf '\n%.0s' {1..2}
sudo service apache2 restart
sudo service apache2 status

# INSTALL POSTGRESQL
printf '\n%.0s' {1..10}
echo -e "\n- - - - - -\n"
echo "set locale and environment variable"
echo -e "\n- - - - - -\n"
printf '\n%.0s' {1..2}
locale-gen en_US ru_RU ru_RU.UTF-8 
export LANG="ru_RU.UTF-8"

printf '\n%.0s' {1..10}
echo -e "\n- - - - - -\n"
echo "install Postgres (run one by one)"
echo -e "\n- - - - - -\n"
printf '\n%.0s' {1..2}
yes | sudo gdebi /fresh-install/postgresql-9.3.4_1.1C_i386_deb/libicu48_4.8.1.1-3ubuntu0.7_i386.deb
printf '\n%.0s' {1..5}
yes | sudo gdebi /fresh-install/postgresql-9.3.4_1.1C_i386_deb/libossp-uuid16_1.6.2-1.1build3_i386.deb
printf '\n%.0s' {1..5}
yes | sudo gdebi /fresh-install/postgresql-9.3.4_1.1C_i386_deb/libpq5_9.3.4-1.1C_i386.deb
printf '\n%.0s' {1..5}
yes | sudo gdebi /fresh-install/postgresql-9.3.4_1.1C_i386_deb/postgresql-client-9.3_9.3.4-1.1C_i386.deb
printf '\n%.0s' {1..5}
yes | sudo gdebi /fresh-install/postgresql-9.3.4_1.1C_i386_deb/postgresql-client-common_154.1.1C_all.deb
printf '\n%.0s' {1..5}
yes | sudo gdebi /fresh-install/postgresql-9.3.4_1.1C_i386_deb/postgresql-common_154.1.1C_all.deb
printf '\n%.0s' {1..5}
yes | sudo gdebi /fresh-install/postgresql-9.3.4_1.1C_i386_deb/postgresql-9.3_9.3.4-1.1C_i386.deb
printf '\n%.0s' {1..5}
yes | sudo gdebi /fresh-install/postgresql-9.3.4_1.1C_i386_deb/postgresql-contrib-9.3_9.3.4-1.1C_i386.deb

printf '\n%.0s' {1..10}
echo -e "\n- - - - - -\n"
echo "create folder for PostgreSQL databse"
echo -e "\n- - - - - -\n"
printf '\n%.0s' {1..2}
sudo mkdir -p /1c/db

printf '\n%.0s' {1..10}
echo -e "\n- - - - - -\n"
echo "Give 'postgres' user access to folder /1c/db"
echo -e "\n- - - - - -\n"
printf '\n%.0s' {1..2}
sudo chown postgres:postgres /1c/db


printf '\n%.0s' {1..10}
echo -e "\n- - - - - -\n"
echo "PostreSQL db initialize"
echo -e "\n- - - - - -\n"
printf '\n%.0s' {1..2}
sudo su - postgres -c "/usr/lib/postgresql/9.3/bin/initdb -D /1c/db --locale=ru_RU.UTF-8"

printf '\n%.0s' {1..10}
echo -e "\n- - - - - -\n"
echo "replace one string with another in /etc/postgresql/9.3/main/pg_hba.conf"
echo -e "\n- - - - - -\n"
printf '\n%.0s' {1..2}
sudo sed -i 's/local   all             postgres                                peer/local   all             postgres                                trust/' /etc/postgresql/9.3/main/pg_hba.conf

printf '\n%.0s' {1..10}
echo -e "\n- - - - - -\n"
echo "restart postgresql service"
echo -e "\n- - - - - -\n"
printf '\n%.0s' {1..2}
sudo service postgresql restart

printf '\n%.0s' {1..10}
echo -e "\n- - - - - -\n"
echo "set up a password for postgres user"
echo -e "\n- - - - - -\n"
printf '\n%.0s' {1..2}
sudo psql -U postgres -c "alter user postgres with password '12345Qwerty';" 

printf '\n%.0s' {1..10}
echo -e "\n- - - - - -\n"
echo "comment all lines and replace one line with these three lines"
echo -e "\n- - - - - -\n"
printf '\n%.0s' {1..2}
sudo sed -i 's/^\([^#]\)/# \1/g' /etc/postgresql/9.3/main/pg_hba.conf
sudo sed -i 's/# local   all             postgres                                trust/local   all             postgres                                peer\nlocal   all             all                                     md5\nhost    all             postgres              127.0.0.1\/32      md5/' /etc/postgresql/9.3/main/pg_hba.conf

printf '\n%.0s' {1..10}
echo -e "\n- - - - - -\n"
echo "restart postgresql service"
echo -e "\n- - - - - -\n"
printf '\n%.0s' {1..2}
sudo service postgresql restart

# INSTALL 1C
printf '\n%.0s' {1..10}
echo -e "\n- - - - - -\n"
echo "install 1C Server x32 (run one by one)"
echo -e "\n- - - - - -\n"

printf '\n%.0s' {1..2}
yes | sudo gdebi /fresh-install/deb-client-server-32/1c-enterprise83-common_8.3.10-2299_i386.deb
printf '\n%.0s' {1..5}
yes | sudo gdebi /fresh-install/deb-client-server-32/1c-enterprise83-common-nls_8.3.10-2299_i386.deb
printf '\n%.0s' {1..5}
yes | sudo gdebi /fresh-install/deb-client-server-32/1c-enterprise83-server_8.3.10-2299_i386.deb
printf '\n%.0s' {1..5}
yes | sudo gdebi /fresh-install/deb-client-server-32/1c-enterprise83-server-nls_8.3.10-2299_i386.deb
printf '\n%.0s' {1..5}
yes | sudo gdebi /fresh-install/deb-client-server-32/1c-enterprise83-ws_8.3.10-2299_i386.deb
printf '\n%.0s' {1..5}
yes | sudo gdebi /fresh-install/deb-client-server-32/1c-enterprise83-ws-nls_8.3.10-2299_i386.deb

printf '\n%.0s' {1..10}
echo -e "\n- - - - - -\n"
echo "Give 'usr1cv8' user access to folder /opt/1C"
echo -e "\n- - - - - -\n"
printf '\n%.0s' {1..2}
sudo chown -R usr1cv8 /opt/1C

printf '\n%.0s' {1..10}
echo -e "\n- - - - - -\n"
echo "Start 1C Server and check status"
echo -e "\n- - - - - -\n"
printf '\n%.0s' {1..2}
sudo service srv1cv83 start
sudo service srv1cv83 status

printf '\n%.0s' {1..10}
echo -e "\n- - - - - -\n"
echo "check ports listeners"
echo -e "\n- - - - - -\n"
printf '\n%.0s' {1..2}
netstat -peant | grep :15

printf '\n%.0s' {1..10}
echo -e "\n- - - - - -\n"
echo "check ports listeners"
echo -e "\n- - - - - -\n"
printf '\n%.0s' {1..2}
sudo netstat -peant | grep :15

printf '\n%.0s' {1..10}
echo -e "\n- - - - - -\n"
echo "create conf file for tech journal"
echo -e "\n- - - - - -\n"
printf '\n%.0s' {1..2}
sudo mkdir -p /opt/1C/v8.3/x86_64/conf
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
</config>' > /opt/1C/v8.3/x86_64/conf/logcfg.xml

printf '\n%.0s' {1..10}
echo -e "\n- - - - - -\n"
echo "create folders for tech journal"
echo -e "\n- - - - - -\n"
printf '\n%.0s' {1..2}
sudo mkdir -p /var/log/1c/logs/excp 
sudo mkdir -p /var/log/1c/logs/vrs 
sudo mkdir -p /var/log/1c/dumps

printf '\n%.0s' {1..10}
echo -e "\n- - - - - -\n"
echo "create 'grp1clogs' user group for users (apache and 1c server)"
echo -e "\n- - - - - -\n"
printf '\n%.0s' {1..2}
sudo groupadd grp1clogs
sudo usermod -a -G grp1clogs www-data
sudo usermod -a -G grp1clogs usr1cv8

printf '\n%.0s' {1..10}
echo -e "\n- - - - - -\n"
echo "Give user group 'grp1clogs' acces to tech log folders"
echo -e "\n- - - - - -\n"
printf '\n%.0s' {1..2}
sudo chown -R usr1cv8:grp1clogs /var/log/1c 
sudo chmod g+rw /var/log/1c

printf '\n%.0s' {1..10}
echo -e "\n- - - - - -\n"
echo "users"
echo -e "\n- - - - - -\n"
printf '\n%.0s' {1..2}
ps aux | grep /opt/1C/v8.3/x86_64/ | grep -v grep | cut -c 1-65 
ps aux | grep apache2 | grep -v grep | cut -c 1-65

printf '\n%.0s' {1..10}
echo -e "\n- - - - - -\n"
echo "install imagemagick"
echo -e "\n- - - - - -\n"
printf '\n%.0s' {1..2}
sudo apt-get -y install imagemagick
sudo find / -xdev -name "*libMagickWand*"

printf '\n%.0s' {1..10}
echo -e "\n- - - - - -\n"
echo "create a link to libMagickWand.so"
echo -e "\n- - - - - -\n"
printf '\n%.0s' {1..2}
sudo ln -s /usr/lib/i386-linux-gnu/libMagickWand-6.Q16.so.2.0.0 /usr/lib/libMagickWand.so

printf '\n%.0s' {1..10}
echo -e "\n- - - - - -\n"
echo "install ms fonts"
echo -e "\n- - - - - -\n"
printf '\n%.0s' {1..2}
sudo apt-get -y install ttf-mscorefonts-installer
sudo fc-cache -fv
sudo ln -s /etc/fonts/conf.avail/10-autohint.conf /etc/fonts/conf.d/

# HASP

printf '\n%.0s' {1..10}
echo -e "\n- - - - - -\n"
echo ""
echo -e "\n- - - - - -\n"
printf '\n%.0s' {1..2}
sudo apt-get -y install libc6:i386
yes | sudo gdebi /fresh-install/hasp/haspd_7.40-eter10ubuntu_i386.deb

printf '\n%.0s' {1..10}
echo -e "\n- - - - - -\n"
echo "Start HASP and check status"
echo -e "\n- - - - - -\n"
printf '\n%.0s' {1..2}
sudo service haspd start
sudo service haspd status

# 1C WS
printf '\n%.0s' {1..10}
echo -e "\n- - - - - -\n"
echo "Add wsap24 library to apache"
echo -e "\n- - - - - -\n"
printf '\n%.0s' {1..2}
sudo echo "LoadModule _1cws_module /opt/1C/v8.3/x86_64/wsap24.so" > /etc/apache2/mods-enabled/wsap24.load

# 1C Debug
printf '\n%.0s' {1..10}
echo -e "\n- - - - - -\n"
echo "Enable debug"
echo -e "\n- - - - - -\n"
printf '\n%.0s' {1..2}
sudo service srv1cv83 stop
sudo sed -i 's/#SRV1CV8_DEBUG=/SRV1CV8_DEBUG=1/' /etc/init.d/srv1cv83
sudo service srv1cv83 start
sudo service srv1cv83 status
sudo systemctl daemon-reload

# INSTALL 1C CLIENT
printf '\n%.0s' {1..10}
echo -e "\n- - - - - -\n"
echo "install 1C client"
echo -e "\n- - - - - -\n"
printf '\n%.0s' {1..2}
yes | sudo gdebi /fresh-install/deb-client-server-32/1c-enterprise83-client_8.3.10-2299_i386.deb
printf '\n%.0s' {1..5}
yes | sudo gdebi /fresh-install/deb-client-server-32/1c-enterprise83-client-nls_8.3.10-2299_i386.deb

printf '\n%.0s' {1..10}
echo -e "\n- - - - - -\n"
echo ""
echo -e "\n- - - - - -\n"
printf '\n%.0s' {1..2}



