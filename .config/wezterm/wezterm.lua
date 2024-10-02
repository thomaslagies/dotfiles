local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("RobotoMono Nerd Font", {weight="DemiBold"})
config.font_size = 20.0

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.color_scheme = "Catppuccin Mocha"

config.keys = {}

config.audible_bell = "Disabled"

return config
