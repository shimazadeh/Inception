FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install mariadb-server mariadb-client curl gettext-base -y

COPY conf/my.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/script_mdb.sh /

COPY ./tools/init.sql /

ENTRYPOINT ["bash", "script_mdb.sh"]

CMD ["/usr/bin/mysqld_safe"]

