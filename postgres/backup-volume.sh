#!/bin/sh

now="$(date +'%Y%m%d')"
docker run --rm -v postgres-data:/backup-data -w /backup-data alpine tar -cz . > postgres-data-$now.tgz
