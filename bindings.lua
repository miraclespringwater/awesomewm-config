local _actions = require("actions")
local scratch = require("scratch")
--{{{ Bindings
local _bindings = {
--        1: Mods              2: Key       3: Scope      4: Group      5: Description          First row
--{ { modkey,           },     "`",         "global",     "launch",     "dropdown terminal"             },
--{ { modkey, "Shift"   },     "`",         "global",     "menu",       "password tool"                 },
--{ { modkey, "Control" },     "`",         "global",     "launch",     "power menu"                    },
--{ { modkey,           },     "0",         "global",     "launch",     "bookmarks"                     },
--{ { modkey, "Shift"   },     "0",         "global",     "launch",     "personal sites"                },
--{ { modkey, "Control" },     "0",         "global",     "launch",     "contacts"                      },
--{ { modkey,           },     "-",         "global",     "launch",     "calculator"                    },
--{ { modkey, "Shift"   },     "-",         "global",     "launch",     "dictionary"                    },
--{ { modkey, "Control" },     "-",         "global",     "launch",     "translator"                    },
--{ { modkey,           },     "=",         "global",     "launch",     "calendar"                      },
--{ { modkey, "Shift"   },     "=",         "global",     "launch",     "calendar widget"               },
--{ { modkey, "Control" },     "=",         "global",     "launch",     "calendar menu"                 },
--{ { modkey,           },     "BackSpace", "global",     "launch",     "clipboard menu"                },
--{ { modkey, "Shift"   },     "BackSpace", "global",     "launch",     "timeshift backup"              },
--{ { modkey, "Control" },     "BackSpace", "global",     "launch",     "timeshift"                     },

--{ { modkey,           },     "q",         "global",     "launch",     "browser"                       },
--{ { modkey,           },     "w",         "global",     "launch",     "wiki"                          },
--{ { modkey,           },     "e",         "global",     "launch",     "editor"                        }, -- vim in goyo mode
--{ { modkey,           },     "r",         "global",     "hotkeys",    "run prompt"                    }, -- may switch to rofi or dmenu
--{ { modkey,           },     "t",         "global",     "launch",     "tasks"                         },
--{ { modkey,           },     "y",         "global",     "launch",     "yay tui"                       },
--{ { modkey,           },     "u",         "global",     "launch",     "virtual machines"              },
--{ { modkey,           },     "i",         "global",     "launch",     "image gallery"                 },
--{ { modkey,           },     "o",         "global",     "launch",     "file manager"                  },
--{ { modkey,           },     "p",         "global",     "launch",     "             "                 },
--{ { modkey,           },     "[",         "global",     "launch",     "dev menu"                      },
--{ { modkey,           },     "]",         "global",     "launch",     "live coding menu"              },
--{ { modkey,           },     "\\",        "global",     "launch",     "git menu"    },

--{ { modkey,           },     "a",         "global",     "launch",     "audio menu"                    },
--{ { modkey,           },     "s",         "global",     "launch",     "stream menu"                   },
--{ { modkey,           },     "d",         "global",     "launch",     "design menu"                   }, -- menu for launching design programs
--{ { modkey,           },     "f",         "global",     "launch",     "folder menu"                   },
--{ { modkey,           },     "g",         "global",     "launch",     "video menu"                    },
--{ { modkey,           },     "h",         "global",     "launch",     "prev song"                     },
--{ { modkey,           },     "j",         "global",     "launch",     "stop song"                     },
--{ { modkey,           },     "k",         "global",     "launch",     "toggle song"                   },
--{ { modkey,           },     "l",         "global",     "launch",     "next song"                     },
--{ { modkey,           },     ";",         "global",     "launch",     "nvim"                          },
--{ { modkey,           },     "'",         "global",     "launch",     "code"                          },
--{ { modkey,           },     "Return",    "global",     "launch",     "terminal"                      },

--{ { modkey,           },     "z",         "global",     "launch",     "blender"                       },
--{ { modkey,           },     "x",         "global",     "launch",     ""                              },
--{ { modkey,           },     "c",         "global",     "launch",     "telegram"                      },
--{ { modkey,           },     "v",         "global",     "launch",     "davinci resolve"               }, -- last nvim session
--{ { modkey,           },     "b",         "global",     "launch",     "bitwig studio"                 },
--{ { modkey,           },     "n",         "global",     "launch",     "left"                          },
--{ { modkey,           },     "m",         "global",     "launch",     "mail"                          },
--{ { modkey,           },     ",",         "global",     "launch",     "prev song"                     },
--{ { modkey,           },     ".",         "global",     "launch",     "next song"                     },
--{ { modkey,           },     "/",         "global",     "launch",     "home fuzzy finder"             },
--{ { modkey,           },     "space",     "global",     "launch",     "terminal"                      },

--        1: Mods              2: Key       3: Scope      4: Group      5: Description                    First row
  { {       },          "XF86AudioMute",    "global",     "hotkey",     "volume_mute"                   },
  { {       },   "XF86AudioLowerVolume",    "global",     "hotkey",     "volume_down"                   },
  { {"Shift"},   "XF86AudioLowerVolume",    "global",     "hotkey",     "volume_min"                    },
  { {       },   "XF86AudioRaiseVolume",    "global",     "hotkey",     "volume_up"                     },
  { {"Shift"},   "XF86AudioRaiseVolume",    "global",     "hotkey",     "volume_max"                    },
  { {       },    "XF86MonBrightnessUp",    "global",     "hotkey",     "brightness_up"                 },
  { {       },  "XF86MonBrightnessDown",    "global",     "hotkey",     "brightness_down"               },
  { {"Shift"},    "XF86MonBrightnessUp",    "global",     "hotkey",     "brightness_max"                },
  { { modkey,           },     "Escape",    "global",     "hotkey",     "lock_screen"                   },
--{ { modkey,           },     "`",         "global",     "launch",     ""                              },
  { { modkey,           },     "0",         "global",     "menu",       "show"                          },
  { { modkey,           },     "-",         "global",     "gaps",       "decrease"                      },
  { { modkey,           },     "=",         "global",     "gaps",       "increase"                      },
  { { modkey,           },     "BackSpace", "global",     "hotkey",     "destroy_notifications"         },

  { { modkey,           },     "Tab",       "global",     "tags",       "go_back"                       },
--{ { modkey,           },     "q",         "global",     "launch",     ""                              },
  { { modkey, "Shift"   },     "q",         "client",     "client",     "close"                         },
--{ { modkey,           },     "w",         "global",     "client",     "go_back"                       },
--{ { modkey,           },     "e",         "global",     "launch",     ""                              }, -- vim in goyo mode
  { { modkey,           },     "r",         "global",     "hotkey",     "run_prompt"                    }, -- may switch to rofi or dmenu
--{ { modkey,           },     "r",         "global",     "rofi",       "run"                           }, 
  { { modkey, "Shift"   },     "r",         "global",     "awesome",    "reload"                        },
  { { modkey, "Control" },     "r",         "global",     "tags",       "rename"                        },
  { { modkey,           },     "t",         "client",     "client",     "toggle_keep_on_top"            },
--{ { modkey,           },     "y",         "global",     "launch",     ""                              },
  { { modkey,           },     "u",         "global",     "client",     "jump_to_urgent"                },
--{ { modkey,           },     "i",         "global",     "launch",     ""                              },
  { { modkey,           },     "o",         "global",     "launch",     "browser"                       },
--{ { modkey,           },     "p",         "global",     "launch",     ""                              },
  { { modkey,           },     "[",         "global",     "client",     "focus_prev_by_index"           },
  { { modkey,           },     "]",         "global",     "client",     "focus_next_by_index"           },
  { { modkey,           },     "backslash", "client",     "client",     "magnify"                       },
--{ { modkey,           },     "a",         "global",     "tags",       ""                              },
  { { modkey, "Control" },     "a",         "global",     "tags",       "add_new"                       },
--{ { modkey,           },     "s",         "global",     "awesome",    ""                              },
  { { modkey,           },     "d",         "global",     "rofi",       "pdf"                           }, -- menu for launching design programs
  { { modkey, "Control" },     "d",         "global",     "tags",       "delete"                        },
  { { modkey,           },     "f",         "client",     "client",     "toggle_fullscreen"             },
--{ { modkey,           },     "g",         "global",     "launch",     ""                              },
  { { modkey, "Shift"   },     "h",         "global",     "client",     "swap_with_left"                },
  { { modkey, "Shift"   },     "j",         "global",     "client",     "swap_with_down"                },
  { { modkey, "Shift"   },     "k",         "global",     "client",     "swap_with_up"                  },
  { { modkey, "Shift"   },     "l",         "global",     "client",     "swap_with_right"               },
--{ { modkey, "Control" },     "h",         "global",     "tags",       "move_to_the_left"          },
  { { modkey,           },     "h",         "global",     "client",     "focus_left"                    },
  { { modkey,           },     "j",         "global",     "client",     "focus_down"                    },
  { { modkey,           },     "k",         "global",     "client",     "focus_up"                      },
  { { modkey,           },     "l",         "global",     "client",     "focus_right"                   },
--{ { modkey, "Control" },     "l",         "global",     "tags",       "move_to_the_right"         },
  { { modkey,           },     ";",         "global",     "layout",     "decrease_master_width_factor"  },
  { { modkey, "Shift"   },     ";",         "global",     "layout",     "decrease_master_count"         },
  { { modkey,           },     "'",         "global",     "layout",     "increase_master_width_factor"  },
  { { modkey, "Shift"   },     "'",         "global",     "layout",     "increase_master_count"         },
  { { modkey,           },     "Return",    "global",     "launch",     "terminal"                      },

--{ { modkey,           },     "z",         "global",     "launch",     ""                              },
--{ { modkey,           },     "x",         "global",     "launch",     ""                              },
  { { modkey, "Control" },     "x",         "global",     "awesome",    "quit"                          },
--{ { modkey,           },     "c",         "global",     "launch",     ""                              },
  { { modkey,           },     "v",         "global",     "launch",     "nvim"                          }, -- last nvim session
  { { modkey,           },     "b",         "global",     "wibox",      "toggle_bar"                    },
  { { modkey,           },     "n",         "global",     "client",     "restore_minimized"             },
  { { modkey,           },     "m",         "client",     "client",     "unmaximize"                    },
  { { modkey, "Shift"   },     "m",         "client",     "client",     "minimize"                      },
  { { modkey,           },     ",",         "client",     "client",     "unmaximize_vertically"         },
  { { modkey,           },     ".",         "global",     "launch",     "unmaximize_horizontally"       },
  { { modkey,           },     "slash",     "global",     "hotkey",     "show_help"                     },

--{ { modkey,           },     "a",         "client",     "scratch",    "wiki"                          },

  { { modkey,           },     "space",     "global",     "layout",     "select_next_layout"            },
  { { modkey, "Shift"   },     "space",     "global",     "layout",     "select_prev_layout"            },
  { { modkey, "Control" },     "f",         "client",     "client",     "toggle_floating"               },
  { { modkey,           },     "Print",     "global",     "hotkey",     "take_screenshot"               },
}
--}}}
--{{{ Set keys
 for i=1, #_bindings do
   -- For each binding
   local b = _bindings[i]
   -- Store mods
   local mods = b[1]
   -- Store key
   local key = b[2]
   -- Store scope
   local scope = b[3]
   -- Store group
   local group = b[4]
   -- Store description
   local desc = b[5]
   -- Find action
   local action = _actions[scope][group][desc]
   -- Create key
   local awesomeKey = awful.key(
          -- modifiers
          mods,
          -- key
          key,
          -- callback
          action,
          -- meta
          { description = desc, group = group }
        )
   -- Store bindings
   if scope == "global" then
     globalkeys = mytable.join( globalkeys, awesomeKey )
   elseif scope == "client" then
     clientkeys = mytable.join( clientkeys, awesomeKey )
   end
 end
 globalkeys = mytable.join(globalkeys, awful.key( {modkey, }, "w", function() scratch.wiki:toggle() end, {description = "toggle wiki", group = "scratch"} ))
 globalkeys = mytable.join(globalkeys, awful.key( {modkey, }, "c", function() scratch.cmus:toggle() end, {description = "toggle cmus", group = "scratch"} ))
 globalkeys = mytable.join(globalkeys, awful.key( {modkey, }, "p", function() scratch.keepass:toggle() end, {description = "toggle keepassxc", group = "scratch"} ))
 globalkeys = mytable.join(globalkeys, awful.key( {modkey, }, "`", function() scratch.term:toggle() end, {description = "toggle scratch terminal", group = "scratch"} ))
 globalkeys = mytable.join(globalkeys, awful.key( {modkey, }, "a", function() scratch.mixer:toggle() end, {description = "toggle mixer", group = "scratch"} ))
--}}}
--{{{ Set global mouse buttons
globalbuttons = mytable.join(
    awful.button({ }, 3, function () awful.util.mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
)
--}}}
--{{{ Set client mouse buttons
clientbuttons = mytable.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)
--}}}
--Set global button and keys
root.buttons(globalbuttons)
root.keys(globalkeys)

