#!/bin/sh

#docker run -d -p 8081:8081 -p 8082:8082 -p 8083:8083 --name nexus -e NEXUS_CONTEXT=nexus -v `pwd`/nexus-data:/nexus-data sonatype/nexus3
#docker run -d -p 8081:8081 -p 8082:8082 -p 8083:8083 --name nexus -e NEXUS_CONTEXT=nexus sonatype/nexus3

docker service create \
--name nexus \
--limit-cpu 2 \
--limit-memory 4096m \
--label 'traefik.nexus.port=8081' \
--label traefik.nexus.frontend.rule="Host:powercurve-build.experian.local;PathPrefix:/nexus" \
--network traefik-net \
--mount source=nexus-data,target=/nexus-data \
--env NEXUS_CONTEXT=nexus \
--label traefik.dockergroup.frontend.rule=Host:docker.powercurve-build.experian.local \
--label traefik.dockergroup.port=8082 \
--label traefik.dockerlocal.frontend.rule=Host:docker-local.powercurve-build.experian.local \
--label traefik.dockerlocal.port=8083 \
sonatype/nexus3

