FROM alpine:3.8
MAINTAINER Stille <stille@ioiox.com>

ENV VERSION v0.5.2

WORKDIR /base
RUN apk add wget && \
    wget -P /base https://github.com/tindy2013/subconverter/releases/download/${VERSION}/subconverter_linux64.tar.gz && \
    tar xzf subconverter_linux64.tar.gz && \
    rm -rf subconverter_linux64.tar.gz && \
    apk del wget && \
    sed -i '/clash_use_new_field_name=true/s/clash_use_new_field_name=true/clash_use_new_field_name=false/g' /base/subconverter/pref.ini

COPY groups.txt /base/subconverter/snippets

EXPOSE 25500

CMD ./subconverter/subconverter
