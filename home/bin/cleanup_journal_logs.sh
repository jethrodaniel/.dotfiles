#!/usr/bin/env bash

# Show disk usage here
find . -maxdepth 1 -exec du -sh {} \; 2>&1 | grep -v "Permission denied" | grep -v "cannot access"

# Show space used by journal logs
journalctl --disk-usage

# Clear all journal logs earlier than 10 days
journalctl --vacuum-time=10d
