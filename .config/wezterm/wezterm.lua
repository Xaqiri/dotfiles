local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- config.color_scheme = 'Tomorrow Night Blue (Gogh)'
-- config.color_scheme = 'Tokyo Night Storm (Gogh)'
config.color_scheme = 'Tokyo Night (Gogh)'
-- config.color_scheme = 'tokyonight_night' -- darkest
-- config.color_scheme = 'tokyonight_moon'
-- config.color_scheme = 'tokyonight_storm' -- lightest
-- config.color_scheme = 'Elio (Gogh)'
-- config.color_scheme = 'decay'
-- config.color_scheme = 'Night Owl (Gogh)'
-- config.color_scheme = 'Kanagawa (Gogh)'

config.window_close_confirmation = 'NeverPrompt'
config.font_size = 16
config.font = wezterm.font { family = 'Victor Mono', weight = 'DemiBold' }
config.adjust_window_size_when_changing_font_size = false
config.window_decorations = "RESIZE"
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.force_reverse_video_cursor = true
config.window_padding = {
    left = '0cell',
    right = '0cell',
    top = '0cell',
    bottom = '0cell',
}

config.colors = {
    split = '#7aa2f7'
}

config.leader = { key = ';', mods = 'CMD', timeout_milliseconds = 1000 }
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
    {
        key = 'd',
        mods = 'CMD',
        action = wezterm.action.ActivateTabRelative(-1),
    },
    {
        key = 'f',
        mods = 'CMD',
        action = wezterm.action.ActivateTabRelative(1),
    },
}
-- config.keys = keymap.keys
-- config.key_tables = keymap.key_tables
return config
