#!/bin/bash

echo 'Testing...'
docker exec -ti rubysinatramysqldockertemplate_ruby_1 bundle exec guard
