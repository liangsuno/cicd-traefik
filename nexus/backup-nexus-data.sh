now="$(date +'%Y%m%d')"
docker run --rm -v nexus-data:/nexus-data alpine tar -cz --exclude='nexus-data/log/*' /nexus-data > nexus-data-$now.tgz
