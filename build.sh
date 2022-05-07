#!/bin/bash

set -e

export VERSION=1.1.1o
export SHA256=9384a2b0570dd80358841464677115df785edb941c71211f75076d72fe6b438f
docker buildx build --load --no-cache --platform linux/amd64 --build-arg VERSION --build-arg SHA256 -t anton-petrov/openssl:1.1.1 -t anton-petrov/openssl:${VERSION} .
