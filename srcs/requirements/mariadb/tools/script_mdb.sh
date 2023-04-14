set -x

envsubst < /init.sql > /init_env.sql
service mysql start
mysql -D mysql < /init_env.sql  2> /dev/null

mysqladmin -u$MYSQL_ROOT_USER -p$MYSQL_ROOT_PASSWORD shutdown
exec mysqld_safe
