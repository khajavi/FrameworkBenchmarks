#!/bin/bash

RETCODE=$(fw_exists ${IROOT}/hot.installed)
[ ! "$RETCODE" == 0 ] || { \
  source $IROOT/hot.installed
  return 0; }

VERSION="0.9.0-SNAPSHOT"
HOT_HOME=$IROOT/hot-$VERSION

fw_get -O https://github.com/dsolimando/Hot/releases/download/0.10.0-SNAPSHOT/hot-0.10.0-SNAPSHOT.tar.gz
fw_untar hot-$VERSION.tar.gz

echo "export HOT_HOME=${HOT_HOME}" > $IROOT/hot.installed
echo -e "export PATH=\$HOT_HOME:\$PATH" >> $IROOT/hot.installed

source $IROOT/hot.installed
