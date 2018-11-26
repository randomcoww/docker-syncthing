#!/bin/sh

SYNCTHING_PATH=${SYNCTHING_PATH:-/var/syncthing/config}
mkdir -p $SYNCTHING_PATH

if [ -n "$SYNCTHING_LOCAL_CONFIG" ]; then
  echo -en "$SYNCTHING_LOCAL_CONFIG" > $SYNCTHING_PATH/config.xml
fi

if [ -n "$CERT_PATH" ]; then
  ln -s $CERT_PATH $SYNCTHING_PATH/cert.pem
fi

if [ -n "$KEY_PATH" ]; then
  ln -s $KEY_PATH $SYNCTHING_PATH/key.pem
fi

exec syncthing \
  -home $SYNCTHING_PATH \
  "$@"