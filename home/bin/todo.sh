#!/usr/bin/env bash

# Outputs files with `TODO` as a space separated list.
#
# Example:
#
#  vim -p $(todo.sh)
#

if ! [ $1 ]
then
  echo 'supply $1!'
  exit 1
fi

grep -rn "TODO" "$1" | ruby -ne 'print $_.split(":").first, " "'

