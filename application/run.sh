#!/usr/bin/env bash

# Change directory.
ScriptDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$ScriptDir"

# Enable strict mode.
set -eu -o pipefail

# Run application using docker-compose in foreground.
docker-compose up --build
