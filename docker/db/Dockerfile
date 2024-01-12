FROM mysql:8.0-debian
ADD conf.d/mysqld.cnf /etc/mysql/conf.d/
RUN apt update -y
RUN apt install logrotate -y
ADD logrotate.d/mysql-slow.conf /etc/logrotate.d/mysql-slow.conf
EXPOSE 3306
CMD ["mysqld"]