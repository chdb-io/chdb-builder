#!/bin/bash

echo "Setup ccache storage... "
[ ! -d "/ccache" ] && mkdir /ccache

echo "Locate chdb sources... "
[ ! -d "/chdb" ] && git clone https://github.com/chdb-io/chdb /chdb

echo "Updating submodules... "
cd /chdb && git pull && git submodule update --init --recursive --jobs 4

echo "Building chdb... "
cd /chdb && bash ./chdb/build.sh

exec "$@"
