#!/usr/bin/env bash

set -euo pipefail

echo "Running git clean to remove files from a previous run, if they exist..."
set -x
git clean -xdf
set +x

./mvnw clean test -Dstyle.color=never \
  -e -Dorg.slf4j.simpleLogger.log.develocity=trace \
  -Dorg.slf4j.simpleLogger.log.develocity.goal.cache=trace
