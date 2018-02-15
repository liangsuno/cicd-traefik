#!/bin/sh

docker service create \
    --name postgres \
    --publish 5432:5432 \
    --network traefik-net \
    --env POSTGRES_PASSWORD=Password123!@# \
    --env PGDATA=/var/lib/postgresql/data/pgdata \
    --mount source=postgres-data,target=/var/lib/postgresql/data/pgdata \
    postgres:9.6.7-alpine
