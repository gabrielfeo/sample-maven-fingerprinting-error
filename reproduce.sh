#!/usr/bin/env bash

set -euo pipefail

dir="unreadable-dir"
link_to_dir="link-level-1"
link_to_link="link-level-2"

echo "Removing files from a previous run, if they exist..."
set -x
sudo rm -rf "$dir" "$link_to_dir" "$link_to_link"
set +x

echo "Creating '$dir' and link parent directories..."
mkdir "$dir"
mkdir -p "$(dirname "$link_to_dir")"
mkdir -p "$(dirname "$link_to_link")"

echo "Linking '$dir' to '$link_to_dir'..."
ln -s "$(grealpath --no-symlinks "$dir")" "$link_to_dir"

echo "Linking '$link_to_dir' to '$link_to_link'..."
ln -s "$(grealpath --no-symlinks "$link_to_dir")" "$link_to_link"

echo "Ensuring links are readable and dir is unreadable"
chmod 777 "$link_to_dir" "$link_to_link"
chmod 000 "$dir"

./mvnw clean test -Dstyle.color=never -e
