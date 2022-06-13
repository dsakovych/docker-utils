FROM mysql:8

COPY scripts/*.sql /docker-entrypoint-initdb.d/
COPY etc/mysql/my.cnf /etc/mysql/my.cnf