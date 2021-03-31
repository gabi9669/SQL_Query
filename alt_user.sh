#!/bin/bash
#
# alt_user.sh <name> <options>
#
##############################################
#
# alt_user.sh <username> createdb
# alt_user.sh <username> nocreatedb
# alt_user.sh <username> chpswd
# alt_user.sh <username> rename
# alt_user.sh <username> createrole
# alt_user.sh <username> nocreaterole
# alt_user.sh <username> nologin
# alt_user.sh <username> login

name="$1"

alter_pswd() {
    psql northwind<<EOF
ALTER ROLE "$name" WITH PASSWORD '$newpswd';
EOF
}

alter_cdb() {
    psql northwind<<EOF
ALTER USER "$name" CREATEDB;
EOF
}

alter_nocdb() {
    psql northwind<<EOF
ALTER USER "$name" NOCREATEDB;
EOF
}

rename_user() {
    psql northwind<<EOF
ALTER ROLE "$name" RENAME TO "$new_name";
EOF
}

create_role() {
    psql northwind<<EOF
ALTER ROLE "$name" CREATEROLE;
EOF
}

nocreate_role() {
    psql northwind<<EOF
ALTER ROLE "$name" NOCREATEROLE;
EOF
}

nologin() {
    psql northwind<<EOF
ALTER ROLE "$name" NOLOGIN;
EOF
}

login() {
    psql northwind<<EOF
ALTER ROLE "$name" LOGIN;
EOF
}


if [ "$2" == "createdb" ]
then
  alter_cdb "$name"
elif [ "$2" == "chpswd" ]
then
  read -p "New password for "$name": " newpswd
  alter_pswd "$name"
elif [ "$2" == "rename" ]
then
  read -p "New name for "$name": " new_name
  rename_user "$name"
elif [ "$2" == "createrole" ]
then
  create_role "$name"
elif [ "$2" == "nologin" ]
then
  nologin "$name"
elif [ "$2"=="login" ]
then
  login "$name"
elif [ "$2"=="nocreatedb"]
then
  alter_nocdb "$name"
elif [ "$2"=="nocreaterole" ]
then
  nocreate_role "$name"
fi

