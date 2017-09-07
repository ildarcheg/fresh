# Install 1C Fresh Ubuntu
How to install 1C Fresh environment for your Ubuntu

## Install
To install the 1C Fresh you just need to copy the line below for your Ubuntu, paste it in the Terminal and press Enter. 
Additional steps shoulb be done before running the commands below.

x64
```
# install curl
sudo apt-get install curl

# download and install git-lfs
cd
curl -O https://raw.githubusercontent.com/ildarcheg/fresh/master/install-fresh/install-source.sh
bash install-source.sh
cd 
rm install-source.sh

# setup 1C Fresh environment 
source <(curl -sL https://raw.githubusercontent.com/ildarcheg/fresh/master/install-fresh/install-fresh-ubuntu.sh)
```

x32
```
sudo apt-get install curl
source <(curl -sL https://raw.githubusercontent.com/ildarcheg/fresh/master/install-fresh/install-fresh-ubuntu32.sh)
```

1C x32
```
sudo apt-get install curl
source <(curl -sL https://raw.githubusercontent.com/ildarcheg/fresh/master/install-fresh/install-1c-ubuntu32.sh)
```
