#!/bin/bash
#
# list_users.sh
#

list_users() {
    psql northwind <<EOF
\du
EOF
}

list_users
