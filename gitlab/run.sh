#!/bin/sh

docker service create \
    --name gitlab \
    --hostname gitlab.cicd.local \
    --label 'traefik.port=80' \
    --label traefik.backend=gitlab \
    --label traefik.frontend.rule="Host:gitlab.cicd.local" \
    --network traefik-net \
    gitlab/gitlab-ce:latest
