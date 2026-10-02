#!/bin/bash
# Centers the frontmost window of the given app (System Events process name).
# ponytail: assumes a single front window per app, good enough for a scratchpad toggle.
app="$1"

osascript -e "
  tell application \"Finder\" to set screenBounds to bounds of window of desktop
  tell application \"System Events\"
    tell process \"$app\"
      set {winW, winH} to size of front window
      set position of front window to {((item 3 of screenBounds) - winW) / 2, ((item 4 of screenBounds) - winH) / 2}
    end tell
  end tell
"
