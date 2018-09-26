FROM openjdk:8-jdk-alpine

ARG version="1.9.0"

RUN apk --update add --no-cache git && \
    wget -q -O - 'https://github.com/redpen-cc/redpen/releases/download/redpen-${version}/redpen-${version}.tar.gz' | tar -xz && \
    cp -av redpen-distribution-${version}/* /usr/local/ && \
    rm -rf redpen-distribution-${version}

CMD ["redpen", "-help"]

