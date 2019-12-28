FROM alpine:edge

RUN set -x \
  \
  && apk add --no-cache \
    syncthing

ENTRYPOINT ["/usr/bin/syncthing"]
