local wezterm = require("wezterm")
local mux = wezterm.mux
local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("RobotoMono Nerd Font", { weight = "Bold" })
config.font_size = 20.0
config.color_scheme = "Catppuccin Mocha"
config.max_fps = 165
config.term = "xterm-256color"

config.enable_tab_bar = true
config.window_decorations = "RESIZE"

config.audible_bell = "Disabled"

-- config.default_prog = {"/opt/homebrew/bin/tmux"}
config.default_cwd = "~/git"

wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

local direction_keys = {
  h = "Left",
  j = "Down",
  k = "Up",
  l = "Right",
}

local function split_nav(key)
  return {
    key = key,
    mods = "CTRL",
    action = wezterm.action_callback(function(win, pane)
      if pane:Get_users_vars().IS_NVIM == "true" then
        -- pass the keys through to vim/nvim
        win:perform_action({
          SendKey = { key = key, mods = "CTRL" },
        }, pane)
      else
        win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
      end
    end),
  }
end

config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 2000 }

local action = wezterm.action

config.keys = {
  { key = "a", mods = "LEADER|CTRL",  action = wezterm.action({ SendString = "\x01" }) },
  {
    key = "-",
    mods = "LEADER",
    action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
  },
  {
    key = "\\",
    mods = "LEADER",
    action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
  },
  {
    key = "s",
    mods = "LEADER",
    action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
  },
  {
    key = "v",
    mods = "LEADER",
    action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
  },
  { key = "o", mods = "LEADER",       action = "TogglePaneZoomState" },
  { key = "z", mods = "LEADER",       action = "TogglePaneZoomState" },
  { key = "c", mods = "LEADER",       action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
  { key = "h", mods = "CTRL",       action = wezterm.action({ ActivatePaneDirection = "Left" }) },
  { key = "j", mods = "CTRL",       action = wezterm.action({ ActivatePaneDirection = "Down" }) },
  { key = "k", mods = "CTRL",       action = wezterm.action({ ActivatePaneDirection = "Up" }) },
  { key = "l", mods = "CTRL",       action = wezterm.action({ ActivatePaneDirection = "Right" }) },
  { key = "H", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Left", 5 } }) },
  { key = "J", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Down", 5 } }) },
  { key = "K", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Up", 5 } }) },
  { key = "L", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Right", 5 } }) },
  { key = "1", mods = "LEADER",       action = wezterm.action({ ActivateTab = 0 }) },
  { key = "2", mods = "LEADER",       action = wezterm.action({ ActivateTab = 1 }) },
  { key = "3", mods = "LEADER",       action = wezterm.action({ ActivateTab = 2 }) },
  { key = "4", mods = "LEADER",       action = wezterm.action({ ActivateTab = 3 }) },
  { key = "5", mods = "LEADER",       action = wezterm.action({ ActivateTab = 4 }) },
  { key = "6", mods = "LEADER",       action = wezterm.action({ ActivateTab = 5 }) },
  { key = "7", mods = "LEADER",       action = wezterm.action({ ActivateTab = 6 }) },
  { key = "8", mods = "LEADER",       action = wezterm.action({ ActivateTab = 7 }) },
  { key = "9", mods = "LEADER",       action = wezterm.action({ ActivateTab = 8 }) },
  { key = "&", mods = "LEADER|SHIFT", action = wezterm.action({ CloseCurrentTab = { confirm = true } }) },
  { key = "d", mods = "LEADER",       action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
  { key = "x", mods = "LEADER",       action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
}

for i = 1, 9 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = "LEADER",
    action = action.ActivateTab(i - 1),
  })
end

bar.apply_to_config(config, { position = "top", separator = { left_icon = "", right_icon = "", field_icon = "", space = 2 } })

return config
