FROM debian:buster

RUN apt update -y && apt install mariadb-server mariadb-client curl gettext-base -y
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/script_mdb.sh /
COPY ./tools/init.sql /

ENTRYPOINT ["bash", "script_mdb.sh"]

CMD ["/usr/bin/mysqld_safe"]