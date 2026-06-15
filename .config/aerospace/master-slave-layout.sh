#!/bin/bash

# Create a master-slave layout in the current workspace.
# juist like in i3

# |--------|-------|
# |        | slave |
# | master |-------|
#	|        | slave |
# |________|_______|

aerospace flatten-workspace-tree
aerospace layout tiles horizontal

win_count=$(aerospace list-windows --workspace focused | wc -l | tr -d ' ')

if [ "$win_count" -lt 3 ]; then
  exit 0
fi

for ((i=1; i<win_count; i++)); do
  aerospace focus right 2>/dev/null
done

aerospace join-with left

for ((i=1; i<win_count; i++)); do
  aerospace focus left 2>/dev/null
done

