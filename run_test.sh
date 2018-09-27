#!/bin/bash
#<help>
# This is test script for docker-redpen.
#
# Usage:
#   ./run_test.sh
#
# Description:
#   This is test script for docker-redpen.
#
# Options:
#
#</help>

# Checks unnecessary paramters
set -ue

# Global constants
readonly target_version="1.5 1.6 1.7 1.8 1.9 1.10"

# func: usage
# param: none
# return: none
function usage() {
  sed -n '/^#<help>/, /^#<\/help>/p' $0  | sed -e '1d;$d' | cut -b3-
  exit 0
}

# func: build
# param: tag_name
# return: always 0
function build() {
  echo "docker build $1/ -t $1"
  docker build $1/ -t "$1"
  return 0
}

# func: run_local
# param: tag_name
# return: always 0
function run_local() {
  echo "docker run -it $1"
  docker run --rm -it "$1" redpen -l 10 -c /usr/local/conf/redpen-conf-ja.xml /usr/local/sample-doc/ja/sampledoc-ja.txt
  return 0
}

# func: run_remote
# param: tag_name
# return: always 0
function run_remote() {
  echo "docker run -it $1"
  docker run --rm -it "takahasi/docker-redpen:$1" redpen -l 10 -c /usr/local/conf/redpen-conf-ja.xml /usr/local/sample-doc/ja/sampledoc-ja.txt
  return 0
}

#<main>
for i in ${target_version}; do
  build $i
  run_local $i
  run_remote $i
done
#</main>

exit 0
