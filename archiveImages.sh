#!/bin/bash

ME="$(basename "${BASH_ARGV0}")"

ARCHIVE_DIR=/mnt/exdisk/images/

mkdir -p $ARCHIVE_DIR

# Allow this script to be executed manually, which requires several variables to be set.
if [ -z "${ALLSKY_HOME}" ] ; then
	ALLSKY_HOME=$(realpath $(dirname "${BASH_ARGV0}")/..)
  export ALLSKY_HOME
fi
# shellcheck disable=SC1090
source "${ALLSKY_HOME}/variables.sh"
# shellcheck disable=SC1090
source "${ALLSKY_CONFIG}/config.sh"

find $ALLSKY_IMAGES -mindepth 1 -maxdepth 1 -type d \
    -mtime +7 \
    -exec mv {} $ARCHIVE_DIR ';' -prune
