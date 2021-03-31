#!/bin/bash

apt-get update
apt-get install -y postgresql postgresql-contrib

sudo -u postgres psql -c "DROP ROLE IF EXISTS vagrant"
sudo -u postgres psql -c "CREATE ROLE vagrant SUPERUSER LOGIN PASSWORD 'vagrant'"

echo "host    all             all             0.0.0.0/0            md5" >> /etc/postgresql/10/main/pg_hba.conf

echo "listen_addresses = '*'" >> /etc/postgresql/10/main/postgresql.conf

sudo -u postgres dropdb northwind
sudo -u postgres createdb northwind
sudo -u postgres psql -d northwind -f /tmp/northwind.sql

systemctl restart postgresql

cp /vagrant/alt_user.sh $HOME/
cp /vagrant/list_users.sh $HOME/
cp /vagrant/usermod.sh $HOME/

chmod +x $HOME/alt_user.sh
chmod +x $HOME/list_users.sh
chmod +x $HOME/usermod.sh