#!/bin/sh

docker service create \
--name mysql \
-p 3306:3306 \
--mount source=mysql-data,target=/var/lib/mysql \
--env MYSQL_ROOT_PASSWORD=*** \
--network traefik-net \
mysql:5.7.21
