--{{{ Actions
return {
  global = {
    awesome = { 
      reload               = awesome.restart, -- assigned
      quit                 = awesome.quit -- assigned
    },

    hotkey = {
      destroy_notifications        = naughty.destroy_all_notifications, -- assigned
      take_screenshot              = function() os.execute("screenshot") end, -- assigned
      lock_screen                  = function() os.execute(scrlocker) end, -- assigned
      show_help                    = hotkeys_popup.show_help, -- assigned
      run_prompt                   = function() awful.screen.focused().mypromptbox:run() end, -- assigned
      lua_execute_prompt           = function ()
                                           awful.prompt.run {
                                             prompt       = "Run Lua code: ",
                                             textbox      = awful.screen.focused().mypromptbox.widget,
                                             exe_callback = awful.util.eval,
                                             history_path = awful.util.get_cache_dir() .. "/history_eval"
                                           }
                                       end
    },

    client = {
      focus_next_by_index          = function() awful.client.focus.byidx(1) end, -- assigned
      focus_prev_by_index          = function() awful.client.focus.byidx(-1) end, -- assigned
      focus_down                   = function() awful.client.focus.global_bydirection("down") if client.focus then client.focus:raise() end end,-- assigned
      focus_up                     = function() awful.client.focus.global_bydirection("up") if client.focus then client.focus:raise() end end, -- assigned
      focus_left                   = function() awful.client.focus.global_bydirection("left") if client.focus then client.focus:raise() end end, -- assigned
      focus_right                  = function() awful.client.focus.global_bydirection("right") if client.focus then client.focus:raise() end end, -- assigned
      swap_next_by_index           = function() awful.client.swap.byidx(1) end, -- assigned
      swap_prev_by_index           = function() awful.client.swap.byidx(-1) end, -- assigned
      jump_to_urgent               = awful.client.urgent.jumpto, -- assigned
      restore_minimized            = function()  -- assigned
                                        local c = awful.client.restore()
                                        -- Focus restored client
                                        if c then
                                            c:emit_signal("request::activate", "key.unminimize", {raise = true})
                                        end
                                      end,
      go_back                      = function() 
                                        awful.client.focus.history.previous()
                                        if client.focus then
                                            client.focus:raise()
                                        end
                                      end
      --"cycle clients"                = function() 
      --                                   if cycle_prev then
      --                                       awful.client.focus.history.previous()
      --                                   else
      --                                       awful.client.focus.byidx(-1)
      --                                   end
      --                                   if client.focus then
      --                                       client.focus:raise()
      --                                   end
      --                                 end
    },

    layout = { -- assigned
      increase_master_width_factor = function() awful.tag.incmwfact(0.05) end,
      decrease_master_width_factor = function() awful.tag.incmwfact(-0.05) end,
      increase_master_count        = function() awful.tag.incnmaster(1,nil,true) end,
      decrease_master_count        = function() awful.tag.incnmaster(-1,nil,true) end,
      increase_column_count        = function() awful.tag.incncol(1,nil,true) end,
      decrease_column_count        = function() awful.tag.incncol(-1,nil,true) end,
      select_next_layout           = function() awful.layout.inc(1) end,
      select_prev_layout           = function() awful.layout.inc(-1) end
    },
    
    tags = {
      add_new                  = lain.util.add_tag,
      rename                   = lain.util.rename_tag,
      move_to_the_right        = function() lain.util.move_tag(1) end,
      move_to_the_left         = function() lain.util.move_tag(-1) end,
      delete                   = lain.util.delete_tag,
      view_next                    = awful.tag.viewnext,
      view_prev                    = awful.tag.viewprev,
      go_back                      = awful.tag.history.restore,
      view_next_nonempty           = function() lain.util.tag_view_nonempty(1) end,
      view_previous_nonempty       = function() lain.util.tag_view_nonempty(-1) end
    },

    wibox = {
      toggle_bar                   = function() 
                                          for s in screen do
                                              s.mywibox.visible = not s.mywibox.visible
                                              if s.mybottomwibox then
                                                  s.mybottomwibox.visible = not s.mybottomwibox.visible
                                              end
                                          end
                                        end
    },

    screen = {
      focus_next_screen            = function() awful.screen.focus_relative(1) end,
      focus_prev_screen            = function() awful.screen.focus_relative(-1) end,
    },

    menu = {
      show                    = function() awful.util.mymainmenu:show() end
    },

    gaps = {
      increase                = function() lain.util.useless_gaps_resize(1) end,
      decrease                = function() lain.util.useless_gaps_resize(-1) end
    },
    -- Dropdown application

    -- Widgets

    -- Screen brightness

    -- Volume control

    -- Launch Programs
    launch = {
      terminal               = function() awful.spawn(terminal) end
    }
  },
  client = {
    client = {
      magnify                      = lain.util.magnify_client,
      toggle_fullscreen            = function(c)
                                           c.fullscreen = not c.fullscreen
                                           c:raise()
                                       end,
      close                        = function(c) c:kill() end,
      -- toggle_floating              = awful.client.floating.toggle,
      toggle_floating              = function(c) awful.client.floating.toggle(); c.ontop = not c.ontop  end,
      move_to_master               = function(c) c:swap(awful.client.getmaster()) end,
      move_to_screen               = function(c) c:move_to_screen() end,
      toggle_keep_on_top           = function(c) c.ontop = not c.ontop end,
      minimize                     = function(c) c.minimized = true end,
      unmaximize                 = function(c) c.maximized = not c.maximized; c:raise() end,
      unmaximize_vertically      = function(c) c.maximized_vertical = not c.maximized_vertical; c:raise() end,
      unmaximize_horizontally    = function(c) c.maximized_horizontal = not c.maximized_horizontal; c:raise() end
    }
  }
}
--}}}
