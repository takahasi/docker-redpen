FROM openjdk:8-jdk-alpine

LABEL maintainer="takahasi <3263ta@gmail.com>" \
     description="docker images of redpen client."

RUN apk --update add --no-cache git && \
    wget -q -O - 'https://github.com/redpen-cc/redpen/releases/download/redpen-1.7.6/redpen-1.7.6.tar.gz' | tar -xz && \
    cp -av redpen-distribution-1.7.6/* /usr/local/ && \
    rm -rf redpen-distribution-1.7.6

CMD ["redpen", "-help"]
