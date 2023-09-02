#!/bin/bash

echo "Setup ccache storage... "
[ ! -d "/ccache" ] && mkdir /ccache

echo "Locate chdb sources... "
[ ! -d "/chdb" ] && git clone https://github.com/chdb-io/chdb /chdb

echo "Updating submodules... "
cd /chdb && git pull && git submodule update --init --recursive --multiple --jobs 0

echo "Building chdb... "
cd /chdb && bash ./chdb/build.sh

echo "Building wheel... "
python3 -m pip install -U pybind11 wheel build tox
python3 -m build --wheel

[ -d "/local" ] && cp ./dist/*.whl /local/

echo "Build Ready!"
ls -alF dist

exec "$@"
