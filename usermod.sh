#!/bin/bash
#
# usermod.sh <add/del> <name> <su/nsu>
#
##############################################
#
# usermod.sh add username su
# usermod.sh add username nsu
# usermod.sh del username

name_pswd="$2"

add_su() {
    psql northwind<<EOF
CREATE ROLE "$name_pswd" SUPERUSER LOGIN PASSWORD '$name_pswd';
EOF
}

add_nsu() {
    psql northwind<<EOF
CREATE ROLE "$name_pswd" LOGIN PASSWORD '$name_pswd';
EOF
}

del_user() {
    psql northwind<<EOF
DROP ROLE "$name_pswd";
EOF
}

if [ "$1" == "add" ] && [ "$3" == "su" ]
then
  add_su "$name_pswd"
elif [ "$1" == "add" ] && [ "$3" == "nsu" ]
then
  add_nsu "$name_pswd"
elif [ "$1" == "del" ]
then
  del_user "name_pswd"
fi
