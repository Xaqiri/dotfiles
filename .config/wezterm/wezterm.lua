local wezterm = require 'wezterm'
-- local lightdecay = require './colors/lightdecay'
-- local decay = require './colors/decayce.toml'
-- local catppuccin = require './colors/catppuccin' 
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- config.color_scheme = 'Tomorrow Night Blue (Gogh)'
-- config.color_scheme = 'Tokyo Night Storm (Gogh)'
config.color_scheme = 'tokyonight_night'
-- config.color_scheme = 'Tokyo Night (Gogh)'
-- config.color_scheme = 'tokyonight_moon'
-- config.color_scheme = 'tokyonight_storm'
-- config.color_scheme = 'Elio (Gogh)'
-- config.color_scheme = 'decay'

config.font = wezterm.font('Victor Mono', { weight = "Medium" })
config.font_size = 16
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_padding = {
  left = '1cell',
  right = 0,
  top = 0,
  bottom = 0,
}
-- config.colors = {
--   indexed = { [16] = "#f1cf8a",[17] = "#dee1e6" },
--   scrollbar_thumb = "#384148",
--   split = "#22262e",
--   tab_bar = {
--     background = "#22262e",
--     active_tab = {
--       bg_color = "#70a5eb",
--       fg_color = "#fafdff"
--     },
--     inactive_tab = {
--       bg_color = "#22262e",
--       fg_color = "#fafdff"
--     },
--     inactive_tab_hover = {
--       bg_color = "#384148",
--       fg_color = "#fafdff"
--     },
--     new_tab = {
--       bg_color = "#22262e",
--       fg_color = "#fafdff"
--     },
--     new_tab_hover = {
--       bg_color = "#384148",
--       fg_color = "#fafdff",
--       italic = true
--     },
--   },
--   visual_bell = "#384148",
--   -- nightbuild only
--   compose_cursor = "#f1cf8a",
--   -- Theme Colors (Decay)
--   foreground = "#b6beca",
--   background = "#171a1f",
--   cursor_bg = "#dee1e6",
--   cursor_border = "#fafdff",
--   cursor_fg = "#22262e",
--   selection_bg = "#575268",
--   selection_fg = "#D9E0EE",
--   ansi = { "#1c252c", "#e05f65", "#78dba9", "#f1cf8a", "#70a5eb", "#c68aee", "#74bee9", "#dee1e6" },
--   brights = { "#384148", "#fc7b81", "#94f7c5", "#ffeba6", "#8cc1ff", "#e2a6ff", "#90daff", "#fafdff" },
-- }

-- decayce
-- config.colors = {
--     indexed = { [16] = "#ecd3a0",[17] = "#cbced3" },
--     scrollbar_thumb = "#1c1e27",
--     split = "#151720",
--     tab_bar = {
--       background = "#151720",
--       active_tab = {
--         bg_color = "#86aaec",
--         fg_color = "#d0d3d8"
--       },
--       inactive_tab = {
--         bg_color = "#151720",
--         fg_color = "#d0d3d8"
--       },
--       inactive_tab_hover = {
--         bg_color = "#1c1e27",
--         fg_color = "#d0d3d8"
--       },
--       new_tab = {
--         bg_color = "#151720",
--         fg_color = "#d0d3d8"
--       },
--       new_tab_hover = {
--         bg_color = "#1c1e27",
--         fg_color = "#d0d3d8",
--         italic = true
--       },
--     },
--     visual_bell = "#1c1e27",
--     -- nightbuild only
--     compose_cursor = "#ecd3a0",
--     -- Theme Colors (Decay)
--     foreground = "#b6beca",
--     background = "#0d0f18",
--     cursor_bg = "#cbced3",
--     cursor_border = "#d0d3d8",
--     cursor_fg = "#151720",
--     selection_bg = "#575268",
--     selection_fg = "#D9E0EE",
--     ansi = { "#1c252c", "#dd6777", "#90ceaa", "#ecd3a0", "#86aaec", "#c296eb", "#93cee9", "#cbced3" },
--     brights = { "#1c1e27", "#e26c7c", "#95d3af", "#f1d8a5", "#8baff1", "#c79bf0", "#89d3ee", "#d0d3d8" },
--   }

return config
