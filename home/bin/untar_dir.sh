#!/bin/bash

set -x

find -name "*tar.gz" -maxdepth 1 -exec tar xvzf {} -C . \;
