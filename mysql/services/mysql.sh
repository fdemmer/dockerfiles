#!/bin/sh

# initialize db if necessary
if [ ! -f /var/lib/mysql/ibdata1 ]; then
    echo "*** Creating new database"
    if [ ! -f /usr/share/mysql/my-default.cnf ]; then
        cp /etc/mysql/my.cnf /usr/share/mysql/my-default.cnf
    fi
    mysql_install_db > /dev/null 2>&1

    echo "*** Starting database server"
    /usr/bin/mysqld_safe --skip-syslog &

    MYSQL_PASSWORD=`pwgen -c -n -1 12`
    echo "*** Granting privileges to root@% with password $MYSQL_PASSWORD"
    /usr/bin/mysqladmin --silent --wait=30 ping || exit 1
    mysql -e "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' WITH GRANT OPTION; FLUSH PRIVILEGES;"

    echo "*** Re-starting database server"
    killall mysqld
    sleep 5s
    /usr/bin/mysqld_safe --skip-syslog

else
    echo "*** Starting database server"
    /usr/bin/mysqld_safe --skip-syslog
fi

