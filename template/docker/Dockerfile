FROM container-registry.oracle.com/database/express:latest

ENV ORACLE_PWD=password

COPY ./scott.sql /docker-entrypoint-initdb.d/scott.sql

EXPOSE 1521 5500
