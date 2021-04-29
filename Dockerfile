FROM ruby:3.0.1-alpine3.13

LABEL org.opencontainers.image.source=https://github.com/mongodb-developer/get-started-ruby

ARG DRIVER_VERSION=2.14.0
ARG MONGOID_VERSION=7.2.2

RUN apk add musl-dev make gcc
RUN addgroup -S gsgroup && adduser -S gsuser -G gsgroup

RUN gem install mongo -v ${DRIVER_VERSION} \
    && gem install mongoid -v ${MONGOID_VERSION} \
    && apk del musl-dev make gcc

USER gsuser

ENTRYPOINT ["/bin/sh", "-c"]