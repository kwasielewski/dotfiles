-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Dracula'
config.font = wezterm.font 'Fira Code'
-- config.window_decorations = "RESIZE"
-- and finally, return the configuration to wezterm
--

config.enable_scroll_bar = true

config.keys = {
  {
    key = "E",
    mods = "CTRL",
    action = wezterm.action_callback(function(window, pane)
      local ansi = window:get_selection_escapes_for_pane(pane);
      window:copy_to_clipboard(ansi)
    end)
  }
}

return config
