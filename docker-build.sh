#!/bin/bash

[ ! -d "./chdb" ] && git clone https://github.com/chdb-io/chdb
[ ! -d "./ccache" ] && mkdir ccache

docker run --rm -ti -v $(pwd)/chdb:/chdb -v $(pwd)/ccache:/ccache chdb-builder
