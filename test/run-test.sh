#!/usr/bin/env bash
set -eo pipefail

pack builder create test-builder --config ./test-builder.toml --pull-policy if-not-present
pack build example-project --builder test-builder --path example-project --pull-policy if-not-present
docker_output=$(docker run example-project)

if [[ "${docker_output}" == "Hello, world!" ]]; then
  echo "Successfully completed the testing"
else
  echo "Test failed: the command output was not as expected"
  exit 1
fi
