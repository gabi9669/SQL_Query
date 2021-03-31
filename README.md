# SQL Query scripts


This project contains some script files withy ou can list, add, delete and alter roles in the northwind sample database. 
The scripts are bound to this database, becouse of `psql northwind`, but if you change that, you can use them in every Postgre databases.

## How does it work:
**List users**: Just run the list_users.sh.

**Create/Delete users**:  <base>usermod.sh</base> <add/del> \<name\> <su/nsu>

     1. usermod.sh add username su - This makes superuser
     2. usermod.sh add username nsu - This makes regular user
     3. usermod.sh del username - This deletes user

User will be created with Login permission by default, and the password are the same as the username.

**Alter roles**:  alt_user.sh \<name\> \<options\>

     1. alt_user.sh username createdb - Add create database permission
     2. alt_user.sh username nocreatedb - Revoke create DB permission
     3. alt_user.sh username chpswd - Asks for new password
     4. alt_user.sh username rename - Asks for the new name
     5. alt_user.sh username createrole - Add create role permission
     6. alt_user.sh username nocreaterole - Revoke create role permission
     7. alt_user.sh username nologin - Revoke login permission
     8. alt_user.sh username login - Add login permission (by default new users have it, if the were created by usermod.sh)

**Base requirements:**

 - git (https://git-scm.com/downloads)
 - Vagrant (https://www.vagrantup.com/downloads)
 - Virtualbox (https://www.virtualbox.org/wiki/Downloads)
 - Database sample - https://github.com/pthom/northwind_psql