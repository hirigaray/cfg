-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup").widget
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
	naughty.notify({ preset = naughty.config.presets.critical,
					 title = "Oops, there were errors during startup!",
					 text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
	local in_error = false
	awesome.connect_signal("debug::error", function (err)
		-- Make sure we don't go into an endless error loop
		if in_error then return end
		in_error = true

		naughty.notify({ preset = naughty.config.presets.critical,
						 title = "Oops, an error happened!",
						 text = tostring(err) })
		in_error = false
	end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init(awful.util.getdir("config") .. "/Serenity/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "st"
editor = os.getenv("EDITOR")
editor_cmd = terminal .. " -e " .. editor

-- notifications
naughty.config.defaults['icon_size'] = 50

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"
-- }}}

-- {{{ Helper functions
local function client_menu_toggle_fn()
	local instance = nil

	return function ()
		if instance and instance.wibox.visible then
			instance:hide()
			instance = nil
		else
			instance = awful.menu.clients({ theme = { width = 250 } })
		end
	end
end
-- }}}

-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
   { "hotkeys", function() return false, hotkeys_popup.show_help end},
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end}
}

mymainmenu = awful.menu(
		{ items = { { "awesome", myawesomemenu, nil },
					{ "term", terminal },
					{ "lock", "slock" }}
					})

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- {{{ Wibar
-- Create a textclock widgez
mytextclock = wibox.widget.textclock("%A, %B %e, %T ", 1)

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
		awful.button({ }, 1, function(t) t:view_only() end),
		awful.button({ modkey }, 1, function(t)
			if client.focus then
				client.focus:move_to_tag(t)
			end
		end),
		awful.button({ }, 3, awful.tag.viewtoggle),
		awful.button({ modkey }, 3, function(t)
			if client.focus then
				client.focus:toggle_tag(t)
			end
		end),
		awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
		awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
				)

local tasklist_buttons = gears.table.join(
		awful.button({ }, 1, function (c)
			if c == client.focus then
			c.minimized = true
			else
			-- Without this, the following
			-- :isvisible() makes no sense
			c.minimized = false
			if not c:isvisible() and c.first_tag then
				c.first_tag:view_only()
			end
			-- This will also un-minimize
			-- the client, if needed
			client.focus = c
				c:raise()
			end
		end),
		awful.button({ }, 3, client_menu_toggle_fn()),
		awful.button({ }, 4, function ()
			awful.client.focus.byidx(1)
		end),
		awful.button({ }, 5, function ()
			awful.client.focus.byidx(-1)
		end))

local function set_wallpaper(s)
	-- Wallpaper
	if beautiful.wallpaper then
		local wallpaper = beautiful.wallpaper
		-- If wallpaper is a function, call it with the screen
		if type(wallpaper) == "function" then
			wallpaper = wallpaper(s)
		end
		gears.wallpaper.maximized(wallpaper, s, true)
	end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
	-- Wallpaper
	set_wallpaper(s)

	-- Each screen has its own tag table.
	awful.tag({ "deva", "asura", "manusya", "tyriagyoni", "preta", "naraka"}, s, awful.layout.layouts[1])

	-- Create a promptbox for each screen
	s.mypromptbox = awful.widget.prompt()

	-- Create a taglist widget
	s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, taglist_buttons)

	-- Create a tasklist widget
	s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, tasklist_buttons)

	-- Create the wibox
	s.mywibox = awful.wibar({ position = "top", screen = s })

	-- Add widgets to the wibox
	s.mywibox:setup {
		layout = wibox.layout.align.horizontal,
		{ -- Left widgets
			layout = wibox.layout.fixed.horizontal,
			s.mytaglist,
			s.mypromptbox,
		},
		{
			layout = wibox.layout.flex.horizontal,
			s.mytasklist,
		},
		{ -- Right widgets
			layout = wibox.layout.fixed.horizontal,
			wibox.widget.systray(),
			mytextclock,
		},
	}
end)
-- }}}

-- {{{ Mouse bindings
root.buttons(gears.table.join(
	awful.button({ }, 3, function () mymainmenu:toggle() end),
))
-- }}}

-- {{{ Key bindings
globalkeys = gears.table.join(
	awful.key({ modkey, }, "Left",  awful.tag.viewprev,
			  {description = "view previous", group = "tag"}),
	awful.key({ modkey, }, "Right", awful.tag.viewnext,
			  {description = "view next",     group = "tag"}),

	-- Layout manipulation
	awful.key({ modkey,        }, "u", awful.client.urgent.jumpto,
			  {description = "jump to urgent client", group = "client"}),
	awful.key({ modkey,        }, "Tab",
		function ()
			awful.client.focus.byidx(1)
			if focus then
				client.focus:raise()
			end
		end,
		{description = "go back", group = "client"}),

	-- Standard program
	awful.key({ modkey, }, "Return", function () awful.spawn(terminal) end,
		{description = "open a terminal", group = "launcher"}),
	awful.key({ modkey, "Control" }, "r", awesome.restart,
		{description = "reload awesome", group = "awesome"}),
	awful.key({ modkey, "Shift"   }, "q", awesome.quit,
		{description = "quit awesome", group = "awesome"}),

	-- Prompt
	awful.key({ modkey }, "r",
		function () awful.screen.focused().mypromptbox:run() end,
		  {description = "run prompt", group = "launcher"}),

	awful.key({ modkey }, "b",
		function () myscreen = awful.screen.focused()
		myscreen.mywibox.visible = not myscreen.mywibox.visible end,
		{description = "toggle statusbar"}
),


clientkeys = gears.table.join(
	awful.key({ modkey, }, "f",
		function (c)
			c.fullscreen = not c.fullscreen
			c.maximized = not c.maximized
			c:raise()
		end,
		{description = "toggle fullscreen", group = "client"}),

	awful.key({ modkey, }, "q",
		function (c)
			c:kill()
		end,
	{description = "close", group = "client"}),

	 wm keys
	awful.key({ modkey, }, "g", function(c) awful.placement.centered(c) end),
	awful.key({ modkey, }, "h", function(c) c:relative_move(-18,0,0,0) awful.placement.no_offscreen(c) end),
	awful.key({ modkey, }, "k", function(c) c:relative_move(0,-18,0,0) awful.placement.no_offscreen(c) end),
	awful.key({ modkey, }, "j", function(c) c:relative_move(0,18,0,0) awful.placement.no_offscreen(c) end),
	awful.key({ modkey, }, "l", function(c) c:relative_move(18,0,0,0) awful.placement.no_offscreen(c) end),

	awful.key({ modkey, "Shift" }, "h", function(c) c:relative_move(0,0,-6,0) awful.placement.no_offscreen(c) end),
	awful.key({ modkey, "Shift" }, "k", function(c) c:relative_move(0,0,0,-12) awful.placement.no_offscreen(c) end),
	awful.key({ modkey, "Shift" }, "j", function(c) c:relative_move(0,0,0,12) awful.placement.no_offscreen(c) end),
	awful.key({ modkey, "Shift" }, "l", function(c) c:relative_move(0,0,6,0) awful.placement.no_offscreen(c) end),
	awful.key({}, "XF86ScreenSaver", function() awful.spawn("slock") end ))

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
	globalkeys = gears.table.join(globalkeys,
		-- View tag only.
		awful.key({ modkey }, "#" .. i + 9,
				  function ()
						local screen = awful.screen.focused()
						local tag = screen.tags[i]
						if tag then
						   tag:view_only()
						end
				  end,
		{description = "view tag #"..i, group = "tag"}),
		-- Toggle tag display.
		awful.key({ modkey, "Control" }, "#" .. i + 9,
			function ()
				local screen = awful.screen.focused()
				local tag = screen.tags[i]
				if tag then
					awful.tag.viewtoggle(tag)
				end
			end,
			{description = "toggle tag #" .. i, group = "tag"}),
		Move client to tag.
		awful.key({ modkey, "Shift" }, "#" .. i + 9,
			function ()
				if client.focus then
					local tag = client.focus.screen.tags[i]
					if tag then
						client.focus:move_to_tag(tag)
					end
				end
			end,
		{description = "move focused client to tag #"..i, group = "tag"}),
		-- Toggle tag on focused client.
		awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
			function ()
				if client.focus then
					local tag = client.focus.screen.tags[i]
					if tag then
						client.focus:toggle_tag(tag)
					end
				end
			end,
		{description = "toggle focused client on tag #" .. i, group = "tag"})
end
	)

clientbuttons = gears.table.join(
	awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
	awful.button({ modkey }, 1, awful.mouse.client.move),
	awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
	-- All clients will match this rule.
	{ rule = { },
	  properties = { border_width = beautiful.border_width,
					 border_color = beautiful.border_normal,
					 focus = awful.client.focus.filter,
					 raise = true,
					 keys = clientkeys,
					 buttons = clientbuttons,
					 screen = awful.screen.preferred,
					 placement = awful.placement.no_overlap+awful.placement.no_offscreen
	 }
	},

	-- Floating clients.
	{ rule_any = {
		instance = {
		  "DTA",  -- Firefox addon DownThemAll.
		  "copyq",  -- Includes session name in class.
		},
		class = {
		  "Arandr",
		  "Gpick",
		  "Kruler",
		  "MessageWin",  -- kalarm.
		  "Sxiv",
		  "Wpa_gui",
		  "pinentry",
		  "veromix",
		  "xtightvncviewer"},

		name = {
		  "Event Tester",  -- xev.
		},
		role = {
		  "AlarmWindow",  -- Thunderbird's calendar.
		  "pop-up",	   -- e.g. Google Chrome's (detached) Developer Tools.
		}
	  }, properties = { floating = true }},

	-- Set Firefox to always map on the tag named "2" on screen 1.
	-- { rule = { class = "Firefox" },
	--   properties = { screen = 1, tag = "2" } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
	-- Center new windows
	awful.placement.centered(c)

	-- Set the windows at the slave,
	-- i.e. put it at the end of others instead of setting it master.
	-- if not awesome.startup then awful.client.setslave(c) end
	if awesome.startup and
	  not c.size_hints.user_position
	  and not c.size_hints.program_position then
	-- Prevent clients from being unreachable after screen count changes.
		awful.placement.no_offscreen(c)
	end
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
	if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
		and awful.client.focus.filter(c) then
		client.focus = c
		c:raise()
	end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
