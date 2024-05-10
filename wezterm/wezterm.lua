-- Pull in the wezterm API

local wezterm = require 'wezterm'



-- This will hold the configuration.

local config = wezterm.config_builder()



-- This is where you actually apply your config choices



-- For example, changing the color scheme:

config.color_scheme = 'Catppuccin Mocha'
config.window_background_opacity = 0.9
config.font = wezterm.font 'FiraCode Nerd Font'
config.font_size = 12.0
config.harfbuzz_features = {"zero" , "ss01", "cv01", "cv06", "cv14", "ss05", "ss04", "ss09"}
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
-- and finally, return the configuration to wezterm

return config
