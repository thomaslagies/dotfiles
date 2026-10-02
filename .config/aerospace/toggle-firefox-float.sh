#!/bin/bash
# Toggles Firefox as a centered floating scratchpad: show (move here, float,
# center) if hidden/tiled, hide (macOS app-hide) if already floating+visible.
# ponytail: grabs the first matching window; multiple Firefox windows aren't disambiguated.
APP_ID=org.mozilla.firefox

win_id=$(aerospace list-windows --monitor all --app-bundle-id "$APP_ID" --format '%{window-id}' | head -1)
if [ -z "$win_id" ]; then
  open -a Firefox
  exit 0
fi

win_layout=$(aerospace list-windows --monitor all --app-bundle-id "$APP_ID" --format '%{window-parent-container-layout}' | head -1)
is_visible=$(osascript -e 'tell application "System Events" to get visible of process "Firefox"')

if [ "$win_layout" = "floating" ] && [ "$is_visible" = "true" ]; then
  osascript -e 'tell application "System Events" to set visible of process "Firefox" to false'
else
  osascript -e 'tell application "System Events" to set visible of process "Firefox" to true'
  cur_workspace=$(aerospace list-workspaces --focused)
  aerospace move-node-to-workspace --window-id "$win_id" "$cur_workspace"
  aerospace focus --window-id "$win_id"
  aerospace layout floating
  "$(dirname "$0")/center-float.sh" Firefox
fi
