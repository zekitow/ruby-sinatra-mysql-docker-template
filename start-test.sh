#!/bin/bash

echo 'Starting test ...'

export RACK_ENV=test
docker-compose -f docker-compose-local.yml up

# stops docker
docker-compose down
