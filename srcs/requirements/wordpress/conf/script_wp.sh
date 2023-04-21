set -x
if ! wp core is-installed --allow-root; then
    wp core download --force --allow-root
    until mysql --user=${MYSQL_USER} --password=${MYSQL_PASSWORD} --host=mariadb $WORDPRESS_DB_NAME; do
        sleep 2
    done
    wp config create --dbname=$WORDPRESS_DB_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$WORDPRESS_DB_HOST --allow-root
    wp core install --url=shabibol.42.fr --title="Inception" --admin_user=$WORDPRESS_DB_USER --admin_password=$WORDPRESS_USER_PASSWORD --admin_email=$WORDPRESS_ROOT_MAIL --skip-email --allow-root
    wp user create $USER1_LOGIN $WORDPRESS_USER_MAIL --user_pass=$WORDPRESS_DB_PASSWORD --role=author --allow-root
fi;
exec "$@"

# wp core download --allow-root

# cp /etc/wp-config.php /var/www

# chmod -R 755 /var/www/

# until  mysql --user=${MYSQL_USER} --password=${MYSQL_PASSWORD} --host=mariadb $WORDPRESS_DB_NAME; do
#     sleep 2
# done

# wp core install --url="shabibol.42.fr" --title="Inception" --admin_user=$WORDPRESS_DB_USER --admin_password=$WORDPRESS_USER_PASSWORD --admin_email=$WORDPRESS_ROOT_MAIL --skip-email --allow-root
# wp config create --dbname=$WORDPRESS_DB_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --allow-root
# wp user create $USER1_LOGIN $WORDPRESS_USER_MAIL --user_pass=$WORDPRESS_DB_PASSWORD --role=author --allow-root

# exec "$@"
