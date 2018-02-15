#!/bin/sh

#docker run -d -p 8080:8080 -p 80:80 -v $PWD/traefik.toml:/etc/traefik/traefik.toml traefik

#docker run -d -p 8080:8080 -p 80:80 \
#-v $PWD/traefik.toml:/etc/traefik/traefik.toml \
#-v /var/run/docker.sock:/var/run/docker.sock \
#traefik

docker service create \
--name traefik \
--constraint 'node.role==manager' \
--publish 80:80 \
--publish 8080:8080 \
--mount type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock \
--network traefik-net \
traefik \
--docker \
--docker.swarmmode \
--docker.domain=powercurve-build.experian.local \
--docker.watch \
--logLevel=INFO \
--web

