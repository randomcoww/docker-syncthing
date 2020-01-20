#!/bin/sh

syncthing_home=${SYNCTHING_HOME:-/var/syncthing/config}
mkdir -p $syncthing_home

if [ -n "$CONFIG" ]; then
  echo -en "$CONFIG" > $syncthing_home/config.xml
fi

if [ -n "$TLS_CRT" ]; then
  echo -en "$TLS_CRT" > $syncthing_home/cert.pem
fi

if [ -n "$TLS_KEY" ]; then
  echo -en "$TLS_KEY" > $syncthing_home/key.pem
fi

exec syncthing \
  -home $syncthing_home \
  "$@"