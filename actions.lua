local scratch = require("scratch")
return {
	global = {
		awesome = {
			reload = awesome.restart, -- assigned
			quit = awesome.quit, -- assigned
		},

		scratch = {
			wiki = function()
				scratch.wiki:toggle()
			end,
			cmus = function()
				scratch.cmus:toggle()
			end,
			keepass = function()
				scratch.keepass:toggle()
			end,
			term = function()
				scratch.term:toggle()
			end,
			mixer = function()
				scratch.mixer:toggle()
			end,
			mail = function()
				scratch.mail:toggle()
			end,
		},

		hotkey = {
			volume_up = function()
				os.execute(string.format("amixer -q set %s 1%%+", beautiful.volume.channel))
				beautiful.volume.update()
			end,
			volume_down = function()
				os.execute(string.format("amixer -q set %s 1%%-", beautiful.volume.channel))
				beautiful.volume.update()
			end,
			volume_max = function()
				os.execute(string.format("amixer -q set %s 100%%", beautiful.volume.channel))
				beautiful.volume.update()
			end,
			volume_min = function()
				os.execute(string.format("amixer -q set %s 0%%", beautiful.volume.channel))
				beautiful.volume.update()
			end,
			volume_mute = function()
				os.execute(
					string.format("amixer -q set %s toggle", beautiful.volume.togglechannel or beautiful.volume.channel)
				)
				beautiful.volume.update()
			end,
			brightness_up = function()
				os.execute("backlight_control +10")
			end,
			brightness_down = function()
				os.execute("backlight_control -10")
			end,
			brightness_max = function()
				os.execute("backlight_control 100")
			end,
			destroy_notifications = naughty.destroy_all_notifications, -- assigned
			take_screenshot = function()
				os.execute("screenshot")
			end, -- assigned
			lock_screen = function()
				os.execute(scrlocker)
			end, -- assigned
			show_help = hotkeys_popup.show_help, -- assigned
			run_prompt = function()
				local s = awful.screen.focused()
				local barWasToggled = s.mywibox.visible
				if not barWasToggled then
					s.mywibox.visible = not s.mywibox.visible
				end
				s.mypromptbox:run()
			end, -- assigned
			lua_execute_prompt = function()
				awful.prompt.run({
					prompt = "Run Lua code: ",
					textbox = awful.screen.focused().mypromptbox.widget,
					exe_callback = awful.util.eval,
					history_path = awful.util.get_cache_dir() .. "/history_eval",
				})
			end,
		},

		client = {
			focus_next_by_index = function()
				awful.client.focus.byidx(1)
			end, -- assigned
			focus_prev_by_index = function()
				awful.client.focus.byidx(-1)
			end, -- assigned

			focus_down = function()
				awful.client.focus.global_bydirection("down")
				if client.focus then
					client.focus:raise()
				end
			end, -- assigned
			focus_up = function()
				awful.client.focus.global_bydirection("up")
				if client.focus then
					client.focus:raise()
				end
			end, -- assigned
			focus_left = function()
				awful.client.focus.global_bydirection("left")
				if client.focus then
					client.focus:raise()
				end
			end, -- assigned
			focus_right = function()
				awful.client.focus.global_bydirection("right")
				if client.focus then
					client.focus:raise()
				end
			end, -- assigned

			swap_next_by_index = function()
				awful.client.swap.byidx(1)
			end,
			swap_prev_by_index = function()
				awful.client.swap.byidx(-1)
			end,

			swap_with_down = function()
				awful.client.swap.global_bydirection("down")
			end, -- assigned
			swap_with_up = function()
				awful.client.swap.global_bydirection("up")
			end, -- assigned
			swap_with_left = function()
				awful.client.swap.global_bydirection("left")
			end, -- assigned
			swap_with_right = function()
				awful.client.swap.global_bydirection("right")
			end, -- assigned

			jump_to_urgent = awful.client.urgent.jumpto, -- assigned
			restore_minimized = function() -- assigned
				local c = awful.client.restore()
				-- Focus restored client
				if c then
					c:emit_signal("request::activate", "key.unminimize", { raise = true })
				end
			end,
			go_back = function()
				awful.client.focus.history.previous()
				if client.focus then
					client.focus:raise()
				end
			end,
		},

		layout = { -- assigned
			increase_master_width_factor = function()
				awful.tag.incmwfact(0.025)
			end,
			decrease_master_width_factor = function()
				awful.tag.incmwfact(-0.025)
			end,
			increase_master_count = function()
				awful.tag.incnmaster(1, nil, true)
			end,
			decrease_master_count = function()
				awful.tag.incnmaster(-1, nil, true)
			end,
			increase_column_count = function()
				awful.tag.incncol(1, nil, true)
			end,
			decrease_column_count = function()
				awful.tag.incncol(-1, nil, true)
			end,
			select_next_layout = function()
				awful.layout.inc(1)
			end,
			select_prev_layout = function()
				awful.layout.inc(-1)
			end,
		},

		tags = {
			add_new = lain.util.add_tag,
			rename = lain.util.rename_tag,
			move_to_the_right = function()
				lain.util.move_tag(1)
			end,
			move_to_the_left = function()
				lain.util.move_tag(-1)
			end,
			delete = lain.util.delete_tag,
			view_next = awful.tag.viewnext,
			view_prev = awful.tag.viewprev,
			go_back = awful.tag.history.restore,
			view_next_nonempty = function()
				lain.util.tag_view_nonempty(1)
			end,
			view_previous_nonempty = function()
				lain.util.tag_view_nonempty(-1)
			end,
		},

		wibox = {
			toggle_bar = function()
				bar_toggled = not bar_toggled
				for s in screen do
					s.mywibox.visible = not s.mywibox.visible
					if s.mybottomwibox then
						s.mybottomwibox.visible = not s.mybottomwibox.visible
					end
				end
			end,
		},

		screen = {
			focus_next_screen = function()
				awful.screen.focus_relative(1)
			end,
			focus_prev_screen = function()
				awful.screen.focus_relative(-1)
			end,
		},

		menu = {
			show = function()
				awful.util.mymainmenu:show()
			end,
		},

		gaps = {
			increase = function()
				lain.util.useless_gaps_resize(1)
			end,
			decrease = function()
				lain.util.useless_gaps_resize(-1)
			end,
		},
		-- Dropdown application

		-- Widgets

		-- Screen brightness

		-- Volume control

		-- Launch Programs
		launch = {
			terminal = function()
				awful.spawn(terminal)
			end,
			browser = function()
				awful.spawn(browser)
			end,
			nvim = function()
				awful.spawn(
					'alacritty -e bash --rcfile /home/dream/.bashrc -c \'fff "$@"; cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"; nvim\''
				)
			end,
		},
		rofi = {
			run = function()
				awful.spawn("rofi -show run")
			end,
			pdf = function()
				awful.spawn("sh /home/dream/.config/rofi/scripts/zathura_selector.sh")
			end,
		},
	},
	client = {
		client = {
			magnify = lain.util.magnify_client,
			toggle_fullscreen = function(c)
				c.fullscreen = not c.fullscreen
				c:raise()
			end,
			close = function(c)
				c:kill()
			end,
			toggle_floating = function(c)
				awful.client.floating.toggle()
				c.ontop = not c.ontop
			end,
			move_to_master = function(c)
				c:swap(awful.client.getmaster())
			end,
			move_to_screen = function(c)
				c:move_to_screen()
			end,
			toggle_keep_on_top = function(c)
				c.ontop = not c.ontop
			end,
			minimize = function(c)
				c.minimized = true
			end,
			unmaximize = function(c)
				c.maximized = not c.maximized
				c:raise()
			end,
			unmaximize_vertically = function(c)
				c.maximized_vertical = not c.maximized_vertical
				c:raise()
			end,
			unmaximize_horizontally = function(c)
				c.maximized_horizontal = not c.maximized_horizontal
				c:raise()
			end,
		},
	},
}
