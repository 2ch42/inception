FROM debian:11

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y mariadb-server && \
    mkdir -p /run/mysqld && \
    chmod 777 /var/lib/mysql /run/mysqld && \
    chown -R mysql:mysql /var/lib/mysql /run/mysqld

COPY conf/my.cnf /etc/mysql/
COPY tools/setup-mariadb.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/setup-mariadb.sh

VOLUME /var/lib/mysql

CMD ["/usr/local/bin/setup-mariadb.sh"]
