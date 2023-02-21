awful.util.tagnames = { "", "", "ﲵ", "", "", "", "﫵", "", "" }
-- ﲵ    ﱘ   
-- home terminal browser code vm stats
-- Let mouse control/navigate to tags
awful.util.taglist_buttons = mytable.join(
	awful.button({}, 1, function(t)
		t:view_only()
	end),
	awful.button({ modkey }, 1, function(t)
		if client.focus then
			client.focus:move_to_tag(t)
		end
	end),
	awful.button({}, 3, awful.tag.viewtoggle),
	awful.button({ modkey }, 3, function(t)
		if client.focus then
			client.focus:toggle_tag(t)
		end
	end),
	awful.button({}, 4, function(t)
		awful.tag.viewnext(t.screen)
	end),
	awful.button({}, 5, function(t)
		awful.tag.viewprev(t.screen)
	end)
)
-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 10 do
	local key = "#" .. i + 9
	local desc = "#" .. i
	--[[use if want to use the tilde key for a tag
	local key
	local desc
	if i == 1 then
		key = "`"
		desc = "home"
	else
		key = "#" .. i - 1 + 9
		desc = "#" .. i - 1
	end
	--]]
	globalkeys = mytable.join(
		globalkeys,
		-- View tag only.
		awful.key({ modkey }, key, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				tag:view_only()
			end
		end, { description = "view tag " .. desc, group = "tag" }),
		-- Toggle tag display.
		awful.key({ modkey, "Control" }, key, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				awful.tag.viewtoggle(tag)
			end
		end, { description = "toggle tag " .. desc, group = "tag" }),
		-- Move client to tag.
		awful.key({ modkey, "Shift" }, key, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:move_to_tag(tag)
				end
			end
		end, { description = "move focused client to tag " .. desc, group = "tag" }),
		-- Toggle tag on focused client.
		awful.key({ modkey, "Control", "Shift" }, key, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:toggle_tag(tag)
				end
			end
		end, { description = "toggle focused client on tag " .. desc, group = "tag" })
	)
end
