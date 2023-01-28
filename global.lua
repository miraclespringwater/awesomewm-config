pcall(require, "luarocks.loader")
gears         = require("gears")
awful         = require("awful")
                require("awful.autofocus")
wibox         = require("wibox")
beautiful     = require("beautiful")
naughty       = require("naughty")
lain          = require("lain")
--local menubar       = require("menubar")
freedesktop   = require("freedesktop")
hotkeys_popup = require("awful.hotkeys_popup")
                require("awful.hotkeys_popup.keys")
mytable       = awful.util.table or gears.table -- 4.{0,1} compatibility

-- {{{ Variable definitions
modkey       = "Mod4"
altkey       = "Mod1"
vi_focus     = false -- vi-like client focus https://github.com/lcpz/awesome-copycats/issues/275
-- Default Programs
terminal     = "alacritty"
awful.util.terminal = terminal
editor       = os.getenv("EDITOR") or "nvim"
browser      = "brave"
-- Key tables for bindings
globalkeys   = { }
clientkeys   = { }
--}}}
