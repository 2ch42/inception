FROM debian:11

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y mariadb-server

COPY conf/my.cnf /etc/mysql/conf.d
COPY tools/setup-mariadb.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/setup-mariadb.sh

CMD ["setup-mariadb.sh"]
