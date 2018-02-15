#!/bin/sh

docker service create \
--name gogs \
-p 10022:22 \
-p 10080:3000 \
--label 'traefik.port=3000' \
--label traefik.frontend.rule="Host:gogs.powercurve-build.experian.local" \
--mount source=gogs-data,target=/data \
--network traefik-net \
gogs/gogs:0.11.34
