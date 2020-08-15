local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gears = require("gears")
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = {}

-- theme.font          = "Source Han Serif Heavy 14"
theme.font          = "Triplicate t4c Bold 11"

theme.bg_normal     = "#ebebeb"
theme.bg_focus      = "#c1c1c1"
theme.bg_urgent     = theme.bg_normal
theme.bg_minimize   = theme.bg_normal
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#1a1a1a"
theme.fg_focus      = "#000000"
theme.fg_urgent     = "#835b55"
theme.fg_minimize   = "#40403b"

theme.useless_gap   = dpi(16)
theme.border_width  = dpi(3)
theme.border_normal = "#a6a6a6"
theme.border_focus  = "#868686"
theme.border_marked = theme.border_focus

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
theme.taglist_fg_focus = "#a6a6a6"
theme.taglist_bg_focus = "#1d3232"
theme.taglist_fg_occupied = "#a6a6a6"
theme.taglist_bg_occupied = "#324949"
theme.taglist_fg_empty = "#a6a6a6"
theme.taglist_bg_empty = "#324949"
theme.prompt_font = theme.font

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = ""
theme.menu_height = dpi(20)
theme.menu_width  = dpi(100)
theme.menu_border_width = 2

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- theme.wallpaper = "/home/kori/Pictures/Wallpapers/neo-nimbus.png"
gears.wallpaper.tiled("/home/kori/Pictures/Patterns/goodbye.png", s)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.tasklist_disable_icon = true

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
