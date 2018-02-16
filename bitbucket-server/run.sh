#!/bin/sh

docker service create \
    --name bitbucket \
    --label 'traefik.port=7990' \
    --label traefik.backend=bitbucket \
    --label traefik.frontend.rule="Host:bitbucket.cicd.local" \
    --network traefik-net \
    --mount source=bitbucket-home,target=/var/atlassian/application-data/bitbucket \
    --env-file=`pwd`/bitbucket.env \
    atlassian/bitbucket-server:5.7.1
