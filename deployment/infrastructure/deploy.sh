#!/usr/bin/env bash

# Change directory.
ScriptDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$ScriptDir"

# Enable strict mode.
set -u -o pipefail

#-------------------------------------------------------------------------------
# Validate args.

EnvironmentPath="${1:-}"

if [ "$EnvironmentPath" == '' ]; then
  echo "Usage: $0 <environment-path>"
  exit 1
fi

#-------------------------------------------------------------------------------
# Deploy environment.

cd "$EnvironmentPath"

terraform init \
  && terraform apply

if [ $? -ne 0 ]; then
  echo 'Environment deployment has failed.'
  exit 1
fi
