#!/bin/bash

echo 'Starting development ...'

export RACK_ENV=development
docker-compose -f docker-compose-local.yml up

# stops docker
docker-compose down
