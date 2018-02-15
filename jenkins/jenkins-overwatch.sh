#!/bin/sh

docker service create \
--name jenkins-overwatch \
--label 'traefik.port=8080' \
--label traefik.frontend.rule="Host:cicd.local;PathPrefix:/jenkins/overwatch" \
--network traefik-net \
--env JENKINS_OPTS="--prefix=/jenkins/overwatch/" \
es/jenkins

