local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("RobotoMono Nerd Font", {weight="DemiBold"})
config.font_size = 20.0
config.color_scheme = "Catppuccin Mocha"
config.max_fps = 144

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.audible_bell = "Disabled"

config.keys = {}

return config
