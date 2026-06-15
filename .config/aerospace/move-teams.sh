#!/bin/bash
aerospace list-windows --all | grep -i teams | awk -F'|' '{print $1}' | tr -d ' ' | while read wid; do
  aerospace move-node-to-workspace --window-id "$wid" 3
done
