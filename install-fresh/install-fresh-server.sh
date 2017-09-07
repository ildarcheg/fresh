# Install 1C Fresh Ubuntu (server and infobases)

# Accept 2 parameters:
# -a: fresh infobase name
# -p: solution infobase name

while getopts ":a:p:" opt; do
  case $opt in
    a) fresh_base_name="$OPTARG"
    ;;
    p) solution_base_name="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done


# SET UP FRESH SERVER MANAGER INFOBASE
echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo "set up Fresh Server"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"

sudo service srv1cv83 restart
sudo echo -e "\n# 1C Server Remote Admin Server\nalias mras='/opt/1C/v8.3/x86_64/ras'" >> ~/.profile
sudo echo -e "\n# 1C Server Remote Admin Console\nalias mrac='/opt/1C/v8.3/x86_64/rac'" >> ~/.profile
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
mrac infobase create --create-database --name=$fresh_base_name --dbms=PostgreSQL --db-server=$server --db-name=$fresh_base_name --locale=en_US --db-user=postgres --db-pwd=12345Qwerty --descr='1C Fresh Manager Service Infobase' --license-distribution=allow --cluster=$cluster >> infobase
infobase=$(cat infobase | cut -d':' -f 2 | cut -d' ' -f 2)
echo $infobase
rm infobase
mrac infobase summary list --cluster=$cluster
mrac infobase info --infobase=$infobase --cluster=$cluster

mrac infobase create --create-database --name=$solution_base_name --dbms=PostgreSQL --db-server=$server --db-name=$solution_base_name --locale=en_US --db-user=postgres --db-pwd=12345Qwerty --descr='1C Solution Infobase' --license-distribution=allow --cluster=$cluster >> infobase
infobase=$(cat infobase | cut -d':' -f 2 | cut -d' ' -f 2)
echo $infobase
rm infobase
mrac infobase summary list --cluster=$cluster
mrac infobase info --infobase=$infobase --cluster=$cluster

echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo "publish Fresh Service Infobase"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"     
sudo echo '# Service Manager External Publication (/a/'$fresh_base_name') 
Alias "/a/'$fresh_base_name'" "/var/www/1cfresh/a/'$fresh_base_name'"
<Directory "/var/www/1cfresh/a/'$fresh_base_name'/">
    AllowOverride All
    Options None
    Order allow,deny
    Allow from all
    SetHandler 1c-application
    ManagedApplicationDescriptor "/var/www/1cfresh/a/'$fresh_base_name'/default.vrd"
</Directory>' >> /etc/apache2/1cfresh_a/$fresh_base_name'.conf'

sudo echo '# Service Manager Internal Publication (/int/'$fresh_base_name') 
Alias "/int/'$fresh_base_name'" "/var/www/1cfresh/int/'$fresh_base_name'"
<Directory "/var/www/1cfresh/int/'$fresh_base_name'/">
    AllowOverride All
    Options None
    Order allow,deny
    Allow from all
    SetHandler 1c-application
    ManagedApplicationDescriptor "/var/www/1cfresh/int/'$fresh_base_name'/default.vrd"
</Directory>' >> /etc/apache2/1cfresh_int/$fresh_base_name'.conf' 

sudo mkdir -p /var/www/1cfresh/a/$fresh_base_name/
sudo mkdir -p /var/www/1cfresh/int/$fresh_base_name/

sudo echo '<?xml version="1.0" encoding="UTF-8"?>
<point 
    xmlns="http://v8.1c.ru/8.2/virtual-resource-system" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
    base="/a/'$fresh_base_name'" 
    ib="Srvr=&quot;'$server'&quot;;Ref=&quot;'$fresh_base_name'&quot;;">
</point>' >> /var/www/1cfresh/a/$fresh_base_name'/default.vrd'

sudo echo '<?xml version="1.0" encoding="UTF-8"?>
<point 
    xmlns="http://v8.1c.ru/8.2/virtual-resource-system" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
    base="/int/'$fresh_base_name'" 
    ib="Srvr=&quot;'$server'&quot;;Ref=&quot;'$fresh_base_name'&quot;;">
</point>' >> /var/www/1cfresh/int/$fresh_base_name'/default.vrd'


echo -e "n\n\n\n\n\n\n\n\n\n\n- - - - - -\n\n\n\n"
echo "publish Solution Infobase"
echo -e "\n\n\n\n- - - - - -\n\n\n\n"     
sudo echo '# Service Manager External Publication (/a/'$solution_base_name') 
Alias "/a/'$solution_base_name'" "/var/www/1cfresh/a/'$solution_base_name'"
<Directory "/var/www/1cfresh/a/'$solution_base_name'/">
    AllowOverride All
    Options None
    Order allow,deny
    Allow from all
    SetHandler 1c-application
    ManagedApplicationDescriptor "/var/www/1cfresh/a/'$solution_base_name'/default.vrd"
</Directory>' >> /etc/apache2/1cfresh_a/$solution_base_name'.conf'

sudo echo '# Service Manager Internal Publication (/int/'$solution_base_name') 
Alias "/int/'$solution_base_name'" "/var/www/1cfresh/int/'$solution_base_name'"
<Directory "/var/www/1cfresh/int/'$solution_base_name'/">
    AllowOverride All
    Options None
    Order allow,deny
    Allow from all
    SetHandler 1c-application
    ManagedApplicationDescriptor "/var/www/1cfresh/int/'$solution_base_name'/default.vrd"
</Directory>' >> /etc/apache2/1cfresh_int/$solution_base_name'.conf' 

sudo mkdir -p /var/www/1cfresh/a/$solution_base_name/
sudo mkdir -p /var/www/1cfresh/int/$solution_base_name/

sudo echo '<?xml version="1.0" encoding="UTF-8"?>
<point 
    xmlns="http://v8.1c.ru/8.2/virtual-resource-system" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
    base="/a/'$solution_base_name'" 
    ib="Srvr=&quot;'$server'&quot;;Ref=&quot;'$solution_base_name'&quot;;">
</point>' >> /var/www/1cfresh/a/$solution_base_name'/default.vrd'

sudo echo '<?xml version="1.0" encoding="UTF-8"?>
<point 
    xmlns="http://v8.1c.ru/8.2/virtual-resource-system" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
    base="/int/'$solution_base_name'" 
    ib="Srvr=&quot;'$server'&quot;;Ref=&quot;'$solution_base_name'&quot;;">
</point>' >> /var/www/1cfresh/int/$solution_base_name'/default.vrd'
