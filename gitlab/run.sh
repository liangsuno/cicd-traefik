#!/bin/sh

docker service create \
    --name gitlab \
    --hostname gitlab.powercurve-build.experian.local \
    --label 'traefik.port=80' \
    --label traefik.backend=gitlab \
    --label traefik.frontend.rule="Host:gitlab.powercurve-build.experian.local" \
    --network traefik-net \
    gitlab/gitlab-ce:latest
