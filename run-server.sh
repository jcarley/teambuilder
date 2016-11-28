#!/usr/bin/env bash

cd /usr/src/app/

./node_modules/brunch/bin/brunch build

mix phoenix.digest
mix ecto.migrate
mix phoenix.server
