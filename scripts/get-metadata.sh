#!/usr/bin/env bash

set -eo pipefail

buildpack_id=$(cat buildpack.toml | yj -tj | jq -r '.buildpack.id')
buildpack_version=$(cat buildpack.toml | yj -tj | jq -r '.buildpack.version')
echo "Buildpack identified: $buildpack_id:$buildpack_version"
echo "id=${buildpack_id}" >> $GITHUB_OUTPUT
echo "version=${buildpack_version}" >> $GITHUB_OUTPUT
