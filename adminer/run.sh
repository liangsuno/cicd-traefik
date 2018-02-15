#!/bin/sh

#docker run --link mysql:db -p 7070:8080 adminer
docker run -p 7070:8080 adminer
exit

docker service create \
--name adminer \
--limit-cpu 1 \
--limit-memory 1024m \
--label 'traefik.port=8080' \
--label traefik.frontend.rule="Host:powercurve-build.experian.local;PathPrefix:/adminer" \
--network traefik-net \
adminer
