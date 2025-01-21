-- This function will run once every time Awesome is started
local function run_once(cmd_arr)
	for _, cmd in ipairs(cmd_arr) do
		awful.spawn.with_shell(string.format("pgrep -u $USER -fx '%s' > /dev/null || (%s)", cmd, cmd))
	end
end

run_once({ "unclutter -root" }) -- comma-separated entries
awful.spawn.with_shell("picom")
awful.spawn.with_shell("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
awful.spawn.with_shell("killall caffeine-indicator -w; caffeine-indicator")
awful.spawn.with_shell("killall nm-applet -w; nm-applet")
awful.spawn.with_shell("/home/dream/.local/bin/start-xidlehooks")
-- This function implements the XDG autostart specification
awful.spawn.with_shell(
	'if (xrdb -query | grep -q "^awesome\\.started:\\s*true$"); then exit; fi;'
		.. 'xrdb -merge <<< "awesome.started:true";'
		-- list each of your autostart commands, followed by ; inside single quotes, followed by ..
		.. 'dex --environment Awesome --autostart --search-paths "$HOME/.config/autostart"' -- https://github.com/jceb/dex
)
--[[
  ProtonMail-Bridge does not have
  an option to start in the tray.
  This command automatically closes
  the window after it is launched.
--]]
--[[ awful.spawn.with_shell('protonmail-bridge & disown && \ ]]
--[[ sleep 5s &&\ ]]
--[[ wmctrl -i -c $(wmctrl -l | grep Proton | cut -d " " -f1) ') ]]
awful.spawn.with_shell("protonmail-bridge")
awful.spawn.with_shell('counter=0\
until [ $counter -gt 20 ] || wmctrl -l | grep Proton\
do\
  sleep 1s\
  ((counter ++))\
done\
wmctrl -i -c $(wmctrl -l | grep Proton | cut -d " " -f1)')
awful.spawn.with_shell("nitrogen --restore")
