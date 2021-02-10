FROM alpine:latest as builder

ARG VERSION=1.8.4
ARG ARCH=amd64
ARG STATIC=-static

RUN wget https://dl.influxdata.com/influxdb/releases/influxdb-${VERSION}${STATIC}_linux_${ARCH}.tar.gz && \
    tar xvfz influxdb-${VERSION}${STATIC}_linux_${ARCH}.tar.gz && \
    rm -f influxdb-${VERSION}${STATIC}_linux_${ARCH}.tar.gz && \
    ([ -f influxdb-${VERSION}-1/influxd ] && cp influxdb-${VERSION}-1/influxd /root || cp influxdb-${VERSION}-1/usr/bin/influxd /root) && \
    rm -rf influxdb-${VERSION}-1


FROM scratch as image
COPY --from=builder /root/influxd /
ENTRYPOINT ["/influxd"]