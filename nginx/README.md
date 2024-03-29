# Description
This repository builds docker from debian/ubuntu sources into a scratch container

# Build

## Build Single Arch
docker build -t nginx-scratch .

## Build Multi Arch
docker buildx build --push --platform linux/arm/v7,linux/arm64/v8,linux/amd64 --tag cwuest/nginx-scratch:latest .

# Run
docker run -p  80:80 nginx-scratch 

# Licenses

This image itself is published under a MIT license. However,  this image likely also contains other software which may be under other licenses (such as SSL or other dependencies). Some licenses are  automatically collected and exported to /licenses within the container. It is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.
