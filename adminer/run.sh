#!/bin/sh

docker service create \
--name adminer \
--limit-cpu 1 \
--limit-memory 1024m \
--label 'traefik.port=8080' \
--label traefik.frontend.rule="Host:cicd.local;PathPrefix:/adminer" \
--network traefik-net \
adminer
