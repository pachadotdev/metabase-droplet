#!/bin/bash

# upgrade packages
apt-get -y update
apt-get -y upgrade
apt-get -y autoremove
apt-get -y autoclean

# install openJDK
apt-get install -y default-jdk

# download and set permission for metabase
wget http://downloads.metabase.com/v0.32.10/metabase.jar
mkdir /opt/metabase/
mv metabase.jar /opt/metabase/metabase.jar
chmod 775 /opt/metabase/metabase.jar

# create service
printf '#!/bin/bash
java -jar /opt/metabase/metabase.jar' | tee -a /opt/metabase/metabase.sh
chmod +x metabase.sh
chmod 775 metabase.sh

printf '[Unit]
Description=Metabase

[Service]
ExecStart="java -jar metabase.jar"
Restart=on-abnormal
WorkingDirectory=/opt/metabase/

[Install]
WantedBy=multi-user.target' | tee -a /etc/systemd/system/metabase.service

