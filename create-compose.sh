#!/bin/bash

docker compose \
    -f base.yaml \
    -f overrides/compose.mariadb.yaml \
    -f overrides/compose.redis.yaml \
    -f overrides/compose.noproxy.yaml \
    config \
    --no-env-resolution \
    --no-interpolate \
    > docker-compose.yaml