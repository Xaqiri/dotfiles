local wezterm = require 'wezterm'
-- local keymap = require 'wezkeys'
-- local lightdecay = require './colors/lightdecay'
-- local decay = require './colors/decayce.toml'
-- local catppuccin = require './colors/catppuccin'
local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- config.color_scheme = 'Tomorrow Night Blue (Gogh)'
-- config.color_scheme = 'Tokyo Night Storm (Gogh)'
-- config.color_scheme = 'Tokyo Night (Gogh)'
config.color_scheme = 'tokyonight_night' -- darkest
-- config.color_scheme = 'tokyonight_moon'
-- config.color_scheme = 'tokyonight_storm' -- lightest
-- config.color_scheme = 'Elio (Gogh)'
-- config.color_scheme = 'decay'

config.font = wezterm.font('Victor Mono', { weight = "Medium" })
config.font_size = 16
config.window_decorations = "RESIZE"
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

config.leader = { key = 't', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
    {
        key = 'v',
        mods = 'LEADER',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
        key = 's',
        mods = 'LEADER',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
        key = 'w',
        mods = 'CMD',
        action = wezterm.action.CloseCurrentPane { confirm = true },
    },
    {
        key = 'h',
        mods = 'LEADER',
        action = wezterm.action.ActivatePaneDirection 'Left',
    },
    {
        key = 'j',
        mods = 'LEADER',
        action = wezterm.action.ActivatePaneDirection 'Down',
    },
    {
        key = 'k',
        mods = 'LEADER',
        action = wezterm.action.ActivatePaneDirection 'Up',
    },
    {
        key = 'l',
        mods = 'LEADER',
        action = wezterm.action.ActivatePaneDirection 'Right',
    },
}
-- config.keys = keymap.keys
-- config.key_tables = keymap.key_tables
return config
