# Inception

##Debug
E: release file https....[...] is not valid yet : `sudo hwclock --hctosys` => This command gets the latest time from your Windows machine’s RTC and sets the system time to that.

MySQL: Package 'mysql-server' has no installation candidate : `sudo apt-get install mariadb-server`

ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (2) : `sudo apt-get install mysql-server`

##Rm all
  - `docker-compose down`
  - `docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)`
  - `docker volume rm $(docker volume ls -q)`
  - `docker rmi -f $(docker images -a -q)`
  - `docker volume ls -qf dangling=true | xargs -r docker volume rm`
  - `docker system prune -f -a`
