#!/usr/bin/env bash

# Extract a *.gz (not `tar`'d). This replaces the zipped file.
#
# To zip back up, use `gzip file`.

usage() {
  cat <<-EOF
		Usage: $PROGRAM_NAME <GZ_FILE>

    Extracts a *.gz (not \`tar\`'d)

	EOF
}

if [ "$1" ]; then
  gzip -d "$1"
else
  usage
fi
