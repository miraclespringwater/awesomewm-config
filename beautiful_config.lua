--local themes = {
--    "blackburn",       -- 1
--    "copland",         -- 2
--    "dremora",         -- 3
--    "holo",            -- 4
--    "multicolor",      -- 5
--    "powerarrow",      -- 6
--    "powerarrow-dark", -- 7
--    "rainbow",         -- 8
--    "steamburn",       -- 9
--    "vertex"           -- 10
--}
--local chosen_theme = themes[5]
--beautiful.init(string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), chosen_theme))
beautiful.init(string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), "custom"))
beautiful.useless_gap = 6
--beautiful.useless_gap = 14
beautiful.gap_single_client = true
--beautiful.master_width_factor = .55
