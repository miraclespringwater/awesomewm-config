--[[

     Modified from the "Multicolor Awesome WM theme 2.0" by github.com/lcpz

--]]

--{{{ colors according to gruvbox vim plugin
-- https://github.com/morhetz/gruvbox/blob/master/colors/gruvbox.vim
-- https://github.com/gruvbox-community/gruvbox/blob/master/colors/gruvbox.vim

local dark0_hard = "#1d2021"
local dark0 = "#282828"
local dark0_soft = "#32302f"
local dark1 = "#3c3836"

local light0_hard = "#f9f5d7"
local light0 = "#fbf1c7"

local bright_red = "#fb4934"
local bright_green = "#b8bb26"
local bright_yellow = "#fabd2f"
local bright_blue = "#83a598"
local bright_purple = "#d3869b"
local bright_aqua = "#8ec07c"
local bright_orange = "#fe8019"

local neutral_red = "#ea6962"
local neutral_green = "#a9b665"
local neutral_yellow = "#d8a657"
local neutral_blue = "#7daea3"
local neutral_purple = "#d3869b"
local neutral_aqua = "#89b482"
local neutral_orange = "#d8a657"

local faded_red = "#9d0006"
local faded_green = "#79740e"
local faded_yellow = "#b57614"
local faded_blue = "#076678"
local faded_purple = "#8f3f71"
local faded_aqua = "#427b58"
local faded_orange = "#af3a03"

local gray = "#928374"

--}}}
--{{{ Other colors
local dark_gray = "#3F3F3F"
local light_gray = "#7F7F7F"
--}}}
--[[

Icon conversion:
downarrow:   bright_green  #b8bb26
uparrow:     bright_red    #fb4934  
volume:      bright_blue   #83a598
ram:         bright_yellow #fabd2f
cpu:         bright_red    #fb4934 
disk:        #458588 or #83a598    
temp:        #fe8019 or #d65d0e
battery:     #fbf1c7
date:        #458588 or #83a598
time:        #cc241d or #fb4934 

--]]

local dpi = require("beautiful.xresources").apply_dpi

local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme = {}
theme.confdir = os.getenv("HOME") .. "/.config/awesome/themes/custom"
--theme.wallpaper                                 = theme.confdir .. "/wall.png"
--theme.wallpaper                                 = os.getenv("HOME") .. "/pix/wallpapers/dark-souls-pixel.jpg"
-- theme.wallpaper = os.getenv("HOME") .. "/pix/wallpapers/forest-2.jpg"
-- theme.wallpaper = os.getenv("HOME") .. "/pix/wallpapers/forest-4.jpg"
theme.wallpaper = os.getenv("HOME") .. "/pix/wallpapers/slowrush-green-hued4.png"
-- theme.wallpaper = os.getenv("HOME") .. "/pix/wallpapers/forest-foggy-misty-cloudy.jpeg"
-- theme.wallpaper = os.getenv("HOME") .. "/pix/wallpapers/forest-3.jpg"
-- theme.wallpaper = os.getenv("HOME") .. "/pix/wallpapers/darksouls3-shrineview.jpeg"
-- theme.wallpaper = os.getenv("HOME") .. "/pix/wallpapers/darksouls-shrine.jpg"
-- theme.wallpaper = os.getenv("HOME") .. "/pix/wallpapers/darksouls-solaire.jpg"
--theme.font                                      = "Terminus 8"
theme.font = "JetBrainsMono Nerd Font Mono 8"
--theme.bg_normal                                 = "#1d2021"
theme.bg_normal = dark0_hard
--theme.bg_focus                                  = "#313131"
theme.bg_focus = dark1
theme.bg_urgent = theme.bg_normal
theme.menu_bg_normal = theme.bg_normal
theme.menu_bg_focus = theme.bg_focus
--theme.fg_normal                                 = "#ebdbb2"
theme.fg_normal = light0
theme.fg_focus = neutral_green
theme.fg_urgent = neutral_red
theme.fg_minimize = theme.fg_normal
theme.border_width = dpi(2)
theme.border_normal = dark0_soft
theme.border_focus = gray
--theme.border_marked                             = "#CC9393"
theme.border_marked = neutral_purple
theme.menu_border_width = 0
theme.menu_width = dpi(200)
theme.menu_submenu_icon = theme.confdir .. "/icons/submenu.png"
theme.menu_fg_normal = theme.fg_normal
theme.menu_fg_focus = theme.fg_focus
theme.menu_bg_normal = theme.bg_normal
theme.menu_bg_focus = theme.bg_focus
theme.widget_temp = theme.confdir .. "/icons/temp.png"
theme.widget_uptime = theme.confdir .. "/icons/ac.png"
theme.widget_cpu = theme.confdir .. "/icons/cpu.png"
theme.widget_weather = theme.confdir .. "/icons/dish.png"
theme.widget_fs = theme.confdir .. "/icons/fs.png"
theme.widget_mem = theme.confdir .. "/icons/mem.png"
theme.widget_note = theme.confdir .. "/icons/note.png"
theme.widget_note_on = theme.confdir .. "/icons/note_on.png"
theme.widget_netdown = theme.confdir .. "/icons/net_down2.png"
theme.widget_netup = theme.confdir .. "/icons/net_up.png"
theme.widget_mail = theme.confdir .. "/icons/mail.png"
theme.widget_batt = theme.confdir .. "/icons/bat.png"
theme.widget_clock = theme.confdir .. "/icons/clock.png"
theme.widget_vol = theme.confdir .. "/icons/spkr.png"
theme.taglist_squares_sel = theme.confdir .. "/icons/square_a.png"
theme.taglist_squares_unsel = theme.confdir .. "/icons/square_b.png"
--theme.taglist_font = "JetBrainsMono Nerd Font Mono 16"
theme.tasklist_plain_task_name = true
theme.tasklist_disable_icon = true
theme.useless_gap = 0
theme.gap_single_client = true
theme.master_width_factor = 0.55
theme.layout_tile = theme.confdir .. "/icons/tile.png"
theme.layout_tilegaps = theme.confdir .. "/icons/tilegaps.png"
theme.layout_tileleft = theme.confdir .. "/icons/tileleft.png"
theme.layout_tilebottom = theme.confdir .. "/icons/tilebottom.png"
theme.layout_tiletop = theme.confdir .. "/icons/tiletop.png"
theme.layout_fairv = theme.confdir .. "/icons/fairv.png"
theme.layout_fairh = theme.confdir .. "/icons/fairh.png"
theme.layout_spiral = theme.confdir .. "/icons/spiral.png"
theme.layout_dwindle = theme.confdir .. "/icons/dwindle.png"
theme.layout_max = theme.confdir .. "/icons/max.png"
theme.layout_fullscreen = theme.confdir .. "/icons/fullscreen.png"
theme.layout_magnifier = theme.confdir .. "/icons/magnifier.png"
theme.layout_floating = theme.confdir .. "/icons/floating.png"

local markup = lain.util.markup

-- Textclock
os.setlocale(os.getenv("LANG")) -- to localize the clock
local clockicon = wibox.widget.imagebox(theme.widget_clock)
local mytextclock = wibox.widget.textclock(
	markup(neutral_green, "%A %d %B ") .. markup(neutral_green, ">") .. markup(neutral_green, " %H:%M ")
)
mytextclock.font = theme.font

-- Calendar
theme.cal = lain.widget.cal({
	attach_to = { mytextclock },
	notification_preset = {
		font = theme.font,
		fg = theme.fg_normal,
		bg = theme.bg_normal,
	},
})

-- Weather
local weathericon = wibox.widget.imagebox(theme.widget_weather)
theme.weather = lain.widget.weather({
	APPID = "9d97325dfd1d36c9b0b79544e5ef98e0",
	city_id = 4699066,
	lang = "en",
	units = "imperial",
	notification_preset = { font = theme.font, fg = theme.fg_normal },
	weather_na_markup = markup.fontfg(theme.font, neutral_green, "N/A "),
	settings = function()
		descr = weather_now["weather"][1]["description"]:lower()
		units = math.floor(weather_now["main"]["temp"])
		widget:set_markup(markup.fontfg(theme.font, neutral_green, descr .. " @ " .. units .. "°F "))
	end,
})

-- / fs
local fsicon = wibox.widget.imagebox(theme.widget_fs)
theme.fs = lain.widget.fs({
	notification_preset = { font = "Terminus 10", fg = theme.fg_normal },
	settings = function()
		widget:set_markup(markup.fontfg(theme.font, light0, string.format("%.1f", fs_now["/"].used) .. "G "))
	end,
})

-- Mail IMAP check
--[[ to be set before use
local mailicon = wibox.widget.imagebox()
theme.mail = lain.widget.imap({
    timeout  = 180,
    server   = "server",
    mail     = "mail",
    password = "keyring get mail",
    settings = function()
        if mailcount > 0 then
            mailicon:set_image(theme.widget_mail)
            widget:set_markup(markup.fontfg(theme.font, "#cccccc", mailcount .. " "))
        else
            widget:set_text("")
            --mailicon:set_image() -- not working in 4.0
            mailicon._private.image = nil
            mailicon:emit_signal("widget::redraw_needed")
            mailicon:emit_signal("widget::layout_changed")
        end
    end
})
--]]

-- CPU
local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
local cpu = lain.widget.cpu({
	settings = function()
		widget:set_markup(markup.fontfg(theme.font, light0, cpu_now.usage .. "% "))
	end,
})

-- Coretemp
local tempicon = wibox.widget.imagebox(theme.widget_temp)
local temp = lain.widget.temp({
	settings = function()
		widget:set_markup(markup.fontfg(theme.font, light0, coretemp_now .. "°C "))
	end,
})

-- Battery
local baticon = wibox.widget.imagebox(theme.widget_batt)
local bat = lain.widget.bat({
	settings = function()
		local perc = bat_now.perc ~= "N/A" and bat_now.perc .. "%" or bat_now.perc

		if bat_now.ac_status == 1 then
			perc = perc .. " plug"
		end

		widget:set_markup(markup.fontfg(theme.font, light0, perc .. " "))
	end,
})

-- ALSA volume
local volicon = wibox.widget.imagebox(theme.widget_vol)
theme.volume = lain.widget.alsa({
	settings = function()
		if volume_now.status == "off" then
			volume_now.level = volume_now.level .. "M"
		end

		widget:set_markup(markup.fontfg(theme.font, light0, volume_now.level .. "% "))
	end,
})

-- Net
local netdownicon = wibox.widget.imagebox(theme.widget_netdown)
local netdowninfo = wibox.widget.textbox()
local netupicon = wibox.widget.imagebox(theme.widget_netup)
local netupinfo = lain.widget.net({
	settings = function()
		-- [[ uncomment if using the weather widget
		if iface ~= "network off" and string.match(theme.weather.widget.text, "N/A") then
			theme.weather.update()
		end
		--]]

		widget:set_markup(markup.fontfg(theme.font, light0, net_now.sent .. " "))
		netdowninfo:set_markup(markup.fontfg(theme.font, light0, net_now.received .. " "))
	end,
})

-- MEM
local memicon = wibox.widget.imagebox(theme.widget_mem)
local memory = lain.widget.mem({
	settings = function()
		widget:set_markup(markup.fontfg(theme.font, light0, mem_now.used .. "M "))
	end,
})

-- MPD
local mpdicon = wibox.widget.imagebox()
theme.mpd = lain.widget.mpd({
	settings = function()
		mpd_notification_preset = {
			text = string.format("%s [%s] - %s\n%s", mpd_now.artist, mpd_now.album, mpd_now.date, mpd_now.title),
		}

		if mpd_now.state == "play" then
			artist = mpd_now.artist .. " > "
			title = mpd_now.title .. " "
			mpdicon:set_image(theme.widget_note_on)
		elseif mpd_now.state == "pause" then
			artist = "mpd "
			title = "paused "
		else
			artist = ""
			title = ""
			--mpdicon:set_image() -- not working in 4.0
			mpdicon._private.image = nil
			mpdicon:emit_signal("widget::redraw_needed")
			mpdicon:emit_signal("widget::layout_changed")
		end
		widget:set_markup(markup.fontfg(theme.font, "#e54c62", artist) .. markup.fontfg(theme.font, "#b2b2b2", title))
	end,
})

function theme.at_screen_connect(s)
	-- Quake application
	s.quake = lain.util.quake({ app = awful.util.terminal })

	-- If wallpaper is a function, call it with the screen
	local wallpaper = theme.wallpaper
	if type(wallpaper) == "function" then
		wallpaper = wallpaper(s)
	end
	gears.wallpaper.maximized(wallpaper, s, true)

	-- Tags
	awful.tag(awful.util.tagnames, s, {
		awful.layout.layouts[1],
		awful.layout.layouts[1],
		awful.layout.layouts[1],
		awful.layout.layouts[1],
		awful.layout.layouts[1],
		awful.layout.layouts[1],
		awful.layout.layouts[1],
		awful.layout.layouts[1],
		awful.layout.layouts[2],
	})

	-- Create a promptbox for each screen
	s.mypromptbox = awful.widget.prompt({
		done_callback = function()
			if not bar_toggled then
				s.mywibox.visible = false
			end
		end,
	})
	-- Create an imagebox widget which will contains an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	s.mylayoutbox = awful.widget.layoutbox(s)
	s.mylayoutbox = wibox.container.margin(s.mylayoutbox, 3, 5, 3, 3)
	s.mylayoutbox:buttons(my_table.join(
		awful.button({}, 1, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 2, function()
			awful.layout.set(awful.layout.layouts[1])
		end),
		awful.button({}, 3, function()
			awful.layout.inc(-1)
		end),
		awful.button({}, 4, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 5, function()
			awful.layout.inc(-1)
		end)
	))
	-- Create a taglist widget
	s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

	-- Create a tasklist widget
	s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

	--[[
    -- TODO: make wibar float by using margin'd widgets with no
    -- background on the wibar itself. The widgets would have
    -- the background instead. The bar is then made to appear
    -- as if it's floating when you set a margin.
    -- Can be rounded by using the shape property.
    --]]
	-- Create the wibox
	s.mywibox = awful.wibar({
		position = "top",
		screen = s,
		height = dpi(24),
		bg = theme.bg_normal,
		fg = theme.fg_normal,
		type = "dock",
		--shape = function(cr,width,height)gears.shape.rounded_rect(cr, width, height, 8) end
	})

	-- Add widgets to the wibox
	s.mywibox:setup({
		layout = wibox.layout.align.horizontal,
		{ -- Left widgets
			layout = wibox.layout.fixed.horizontal,
			--s.mylayoutbox,
			--wibox.container.margin(s.mytaglist, 5),
			s.mytaglist,
			s.mypromptbox,
			mpdicon,
			theme.mpd.widget,
		},
		s.mytasklist, -- Middle widget
		-- nil,
		{ -- Right widgets
			layout = wibox.layout.fixed.horizontal,
			wibox.widget.systray(),
			--mailicon,
			--theme.mail.widget,
			netdownicon,
			netdowninfo,
			netupicon,
			netupinfo.widget,
			volicon,
			theme.volume.widget,
			memicon,
			memory.widget,
			cpuicon,
			cpu.widget,
			fsicon,
			theme.fs.widget,
			tempicon,
			temp.widget,
			baticon,
			bat.widget,
			weathericon,
			theme.weather.widget,
			clockicon,
			mytextclock,
			s.mylayoutbox,
		},
	})
end

return theme
