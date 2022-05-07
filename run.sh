#!/bin/bash

VERSION=1.1.1o
# --entrypoint sh
docker run --rm -v `pwd`/:/home -it anton-petrov/openssl:${VERSION} ${1}