#!/bin/bash

# upgrade packages
apt-get -y update
apt-get -y upgrade
apt-get -y autoremove
apt-get -y autoclean

# install openJDK
apt-get install -y default-jdk

# download and set permission for metabase
wget https://downloads.metabase.com/v0.36.4/metabase.jar
mkdir /opt/metabase/
mv metabase.jar /opt/metabase/metabase.jar
chmod 775 /opt/metabase/metabase.jar

# create service
printf '#!/bin/bash
java -jar /opt/metabase/metabase.jar' | tee -a /opt/metabase/metabase.sh
chmod +x /opt/metabase/metabase.sh
chmod 775 /opt/metabase/metabase.sh

printf '[Unit]
Description=Metabase

[Service]
ExecStart=/opt/metabase/metabase.sh
Restart=on-abnormal
WorkingDirectory=/opt/metabase/

[Install]
WantedBy=multi-user.target' | tee -a /etc/systemd/system/metabase.service

# activate service
systemctl enable metabase && systemctl start metabase

# open ports
ufw allow http
ufw allow https
ufw allow ssh
ufw allow 3000
