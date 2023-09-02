#!/bin/bash

[ ! -d "./chdb" ] && git clone https://github.com/chdb-io/chdb
[ ! -d "./ccache" ] && mkdir ccache
[ ! -d "./dist" ] && mkdir dist

docker build -t chdb-builder .
docker run --rm -ti -v $(pwd)/chdb:/chdb -v $(pwd)/ccache:/ccache -v $(pwd)/dist:/local chdb-builder
