VERSION=1.8.4
docker build --build-arg VERSION=$VERSION --build-arg ARCH=amd64 --build-arg STATIC=-static -t docker.io/seidelm/distroless-influxdb:amd64-$VERSION .
docker build --build-arg VERSION=$VERSION --build-arg ARCH=armhf --build-arg STATIC= -t docker.io/seidelm/distroless-influxdb:armhf-$VERSION .
docker build --build-arg VERSION=$VERSION --build-arg ARCH=armhf --build-arg STATIC= -t docker.io/seidelm/distroless-influxdb:arm64-$VERSION .
docker push docker.io/seidelm/distroless-influxdb:amd64-$VERSION
docker push docker.io/seidelm/distroless-influxdb:armhf-$VERSION
docker push docker.io/seidelm/distroless-influxdb:arm64-$VERSION
docker rmi docker.io/seidelm/distroless-influxdb:amd64-$VERSION
docker rmi docker.io/seidelm/distroless-influxdb:armhf-$VERSION
docker rmi docker.io/seidelm/distroless-influxdb:arm64-$VERSION

DOCKER_CLI_EXPERIMENTAL=enabled docker manifest create --amend docker.io/seidelm/distroless-influxdb:$VERSION docker.io/seidelm/distroless-influxdb:amd64-$VERSION docker.io/seidelm/distroless-influxdb:armhf-$VERSION docker.io/seidelm/distroless-influxdb:arm64-$VERSION

DOCKER_CLI_EXPERIMENTAL=enabled docker manifest annotate docker.io/seidelm/distroless-influxdb:$VERSION docker.io/seidelm/distroless-influxdb:amd64-$VERSION --os linux --arch amd64
DOCKER_CLI_EXPERIMENTAL=enabled docker manifest annotate docker.io/seidelm/distroless-influxdb:$VERSION docker.io/seidelm/distroless-influxdb:armhf-$VERSION --os linux --arch arm --variant v7
DOCKER_CLI_EXPERIMENTAL=enabled docker manifest annotate docker.io/seidelm/distroless-influxdb:$VERSION docker.io/seidelm/distroless-influxdb:armhf-$VERSION --os linux --arch arm64 --variant v8
DOCKER_CLI_EXPERIMENTAL=enabled docker manifest push docker.io/seidelm/distroless-influxdb:$VERSION