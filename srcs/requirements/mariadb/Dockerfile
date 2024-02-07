FROM debian:11

# VOLUME /var/lib/mysql

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y mariadb-server && \
    mkdir -p /run/mysqld && \
    chown -R mysql:mysql /var/lib/mysql /run/mysqld

COPY conf/my.cnf /etc/mysql/
COPY tools/setup-mariadb.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/setup-mariadb.sh

ENTRYPOINT ["/usr/local/bin/setup-mariadb.sh"]
