#!/usr/bin/env bash

./node_modules/brunch/bin/brunch build
mix phoenix.digest
mix ecto.migrate
mix phoenix.server
