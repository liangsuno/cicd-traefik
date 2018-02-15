#!/bin/sh

docker service create \
--name jenkins-liangsuno \
--label 'traefik.port=8080' \
--label traefik.frontend.rule="Host:powercurve-build.experian.local;PathPrefix:/liangsuno" \
--network traefik-net \
--env JENKINS_OPTS="--prefix=/liangsuno/" \
es/jenkins

