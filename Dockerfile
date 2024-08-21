FROM ruby:3.4-rc-alpine

LABEL org.opencontainers.image.source=https://github.com/mongodb-developer/get-started-ruby

ARG DRIVER_VERSION=2.20.0
ARG MONGOID_VERSION=9.0.1

RUN apk add musl-dev make gcc
RUN addgroup -S gsgroup && adduser -S gsuser -G gsgroup

RUN gem install mongo -v ${DRIVER_VERSION} \
    && gem install mongoid -v ${MONGOID_VERSION} \
    && apk del musl-dev make gcc

USER gsuser

ENTRYPOINT ["/bin/sh", "-c"]