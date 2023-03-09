local bling = require("bling")
-- NOTE: the "rule" scratchpad property is how to FIND the scratchpad and is
-- not actually set on the window by blong

local scratch = {}

scratch.wiki = bling.module.scratchpad{
	command = "alacritty --class wiki-spad -e nvim +VimwikiIndex",
	rule = { instance = "wiki-spad" },
	sticky = true,
	autoclose = false,
	floating = true,
	geometry = { x = 360, y = 90, height = 900, width = 1200 },
	reapply = false,
	dont_focus_before_close = false,
}

return scratch
