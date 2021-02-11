FROM golang:1.8-alpine as builder

ARG ARCH=amd64

COPY main.go .

RUN GOOS=linux GOARCH=${ARCH} go build -ldflags '-w -s' -a -installsuffix cgo -o exit-zero


FROM scratch as image
COPY --from=builder /go/exit-zero /
ENTRYPOINT ["/exit-zero"]