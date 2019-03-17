FROM alpine:latest as builder

ARG VERSION=0.54.0

ADD https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_${VERSION}_Linux-64bit.tar.gz /hugo.tar.gz

RUN tar -zxvf hugo.tar.gz
RUN ["/hugo", "version"]

FROM alpine:latest

COPY --from=builder /hugo .