docker build --build-arg ARCH=amd64 -t docker.io/seidelm/distroless-exit-zero:amd64 .
docker build --build-arg ARCH=arm -t docker.io/seidelm/distroless-exit-zero:armhf .
docker build --build-arg ARCH=arm -t docker.io/seidelm/distroless-exit-zero:arm64 .
docker push docker.io/seidelm/distroless-exit-zero:amd64
docker push docker.io/seidelm/distroless-exit-zero:armhf
docker push docker.io/seidelm/distroless-exit-zero:arm64
docker rmi docker.io/seidelm/distroless-exit-zero:amd64
docker rmi docker.io/seidelm/distroless-exit-zero:armhf
docker rmi docker.io/seidelm/distroless-exit-zero:arm64

DOCKER_CLI_EXPERIMENTAL=enabled docker manifest create --amend docker.io/seidelm/distroless-exit-zero:latest docker.io/seidelm/distroless-exit-zero:amd64 docker.io/seidelm/distroless-exit-zero:armhf docker.io/seidelm/distroless-exit-zero:arm64

DOCKER_CLI_EXPERIMENTAL=enabled docker manifest annotate docker.io/seidelm/distroless-exit-zero:latest docker.io/seidelm/distroless-exit-zero:amd64 --os linux --arch amd64
DOCKER_CLI_EXPERIMENTAL=enabled docker manifest annotate docker.io/seidelm/distroless-exit-zero:latest docker.io/seidelm/distroless-exit-zero:armhf --os linux --arch arm --variant v7
DOCKER_CLI_EXPERIMENTAL=enabled docker manifest annotate docker.io/seidelm/distroless-exit-zero:latest docker.io/seidelm/distroless-exit-zero:armhf --os linux --arch arm64 --variant v8
DOCKER_CLI_EXPERIMENTAL=enabled docker manifest push docker.io/seidelm/distroless-exit-zero:latest