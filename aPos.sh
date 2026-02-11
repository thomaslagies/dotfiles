#!/bin/bash
caffeinate -d &
while true; do
	prevApp=$(osascript -e 'tell application "System Events" to get name of first application process whose frontmost is true')
	if [ "$prevApp" = "wezterm-gui" ]; then
		prevApp="WezTerm"
	fi
	if [ "$prevApp" = "MSTeams" ]; then
		prevApp="Microsoft Teams"
	fi
	open -a "Microsoft Teams"
	osascript -e 'tell application "Microsoft Teams" to activate' -e 'tell application "System Events" to set frontmost of process "Microsoft Teams" to true'
	sleep 1
	osascript -e 'tell application "System Events" to keystroke "2" using {command down}'
	osascript -e "tell application \"$prevApp\" to activate"
	sleep 285
done
