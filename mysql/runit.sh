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

    echo "*** Granting privileges to root@%"
    /usr/bin/mysqladmin --silent --wait=30 ping || exit 1
    echo "GRANT ALL ON *.* TO 'root'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES;" | mysql

    echo "*** Re-starting database server"
    killall mysqld
    sleep 5s
    /usr/bin/mysqld_safe --skip-syslog

else
    echo "*** Starting database server"
    /usr/bin/mysqld_safe --skip-syslog
fi

