FROM alpine:3.8
MAINTAINER Stille <stille@ioiox.com>

ENV VERSION v0.4.3

WORKDIR /base
RUN apk add wget && \
    wget -P /base https://github.com/tindy2013/subconverter/releases/download/${VERSION}/subconverter_linux64.tar.gz && \
    tar xzf subconverter_linux64.tar.gz && \
    rm -rf subconverter_linux64.tar.gz && \
    apk del wget
COPY groups.txt /base/subconverter/snippets

EXPOSE 25500

CMD ./subconverter/subconverter