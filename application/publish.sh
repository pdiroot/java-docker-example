#!/usr/bin/env bash

# Change directory.
ScriptDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$ScriptDir"

# Enable strict mode.
set -eu -o pipefail

# Build and publish containers.
docker build -t java-docker-app-backend:latest backend \
  && docker tag java-docker-app-backend:latest docker.io/pdiroot/java-docker-app-backend:latest \
  && docker push docker.io/pdiroot/java-docker-app-backend:latest

docker build -t java-docker-app-frontend:latest frontend \
  && docker tag java-docker-app-frontend:latest docker.io/pdiroot/java-docker-app-frontend:latest \
  && docker push docker.io/pdiroot/java-docker-app-frontend:latest
