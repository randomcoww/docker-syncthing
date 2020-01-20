FROM alpine:edge

RUN set -x \
  \
  && apk add --no-cache \
    syncthing

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
