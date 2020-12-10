if pacman -Qs libxft >/dev/null 2>&1; then
	# Start graphical server on user's current tty if not already running.
	[[-z $(pgrep -u $USER "\bXorg$") ]] && exec startx
else

