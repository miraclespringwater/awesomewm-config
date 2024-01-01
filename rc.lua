pcall(require, "luarocks.loader")
gears = require("gears")
awful = require("awful")
require("awful.autofocus")
wibox = require("wibox")
beautiful = require("beautiful")
naughty = require("naughty")
lain = require("lain")
--local menubar       = require("menubar")
freedesktop = require("freedesktop")
hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")
mytable = awful.util.table or gears.table -- 4.{0,1} compatibility

-- {{{ Variable definitions
modkey = "Mod4"
altkey = "Mod1"
vi_focus = false -- vi-like client focus https://github.com/lcpz/awesome-copycats/issues/275
-- Default Programs
terminal = "alacritty"
awful.util.terminal = terminal
editor = os.getenv("EDITOR") or "nvim"
browser = "brave"
scrlocker = "my-screen-locker"
-- Key tables for bindings
globalkeys = {}
clientkeys = {}
-- Variable for trackin toggle of bar
bar_toggled = true
-- Global sleep function
function SLEEP(n)
	os.execute("sleep " .. tonumber(n))
end

-- handles tag names, tag button bindings, tag key bindings
require("tags")
-- handles task list button bindings
require("tasklist")
-- sets available layouts and lain layout configurations
require("layouts")
-- loads autostart programs, including XDG autostart applications
require("autostart")
-- loads beautiful theme and configs (such as gaps)
require("beautiful_config")
-- creates a launcher widget and context menu
require("menu")
-- handles configurations for connected screens, also sets a wibox for each screen
require("screen")
-- sets up global and client keybindings. globalkeys is set in this file, clientkeys are set in "rules.lua"
require("bindings") -- "bindings.lua" requires "actions.lua" locally
-- handles window spawning rules, clientkeys, clientbuttons created during "bindings.lua" are set on all clients
require("rules")
-- handles client signals
require("signals")
-- {{{ Error Handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
	naughty.notify({
		preset = naughty.config.presets.critical,
		title = "Oops, there were errors during startup!",
		text = awesome.startup_errors,
	})
end
-- Handle runtime errors after startup
do
	local in_error = false
	awesome.connect_signal("debug::error", function(err)
		if in_error then
			return
		end
		in_error = true
		naughty.notify({
			preset = naughty.config.presets.critical,
			title = "Oops, an error happened!",
			text = tostring(err),
		})
		in_error = false
	end)
end
-- }}}
