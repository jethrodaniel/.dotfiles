#!/usr/bin/env bash

# Rewrite entire branch history, replacing email

BAD_EMAIL="bad@example.com"
GOOD_EMAIL="good@example.com"

git filter-branch --commit-filter '
  if [ "$GIT_AUTHOR_EMAIL" = "$BAD_EMAIL" ];
    then
      GIT_AUTHOR_EMAIL="$GOOD_EMAIL";
      git commit-tree "$@";
    else
      git commit-tree "$@";
  fi' HEAD
