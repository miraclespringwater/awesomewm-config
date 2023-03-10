local bling = require("bling")
-- NOTE: the "rule" scratchpad property is how to FIND the scratchpad and is
-- not actually set on the window by blong

local scratch = {}

scratch.wiki = bling.module.scratchpad({
	command = "alacritty --title wiki-spad --class wiki-spad -e nvim +VimwikiIndex",
	rule = { instance = "wiki-spad" },
	sticky = true,
	autoclose = false,
	floating = true,
	geometry = { x = 900, y = 100, height = 800, width = 975 },
	reapply = true,
	dont_focus_before_close = true,
})

scratch.cmus = bling.module.scratchpad({
	command = "alacritty --class cmus-spad -e cmus",
	rule = { instance = "cmus-spad" },
	sticky = false,
	autoclose = true,
	floating = true,
	geometry = { x = 100, y = 100, height = 600, width = 1200 },
	reapply = true,
	dont_focus_before_close = true,
})

scratch.cmus:connect_signal("turn_on", function(c)
	c.ontop = true
end)

return scratch
