local vars = require("config/variables")
local mod = vars.mod

-- Pane actions
hl.bind(mod .. " + Q", hl.dsp.window.close())
hl.bind(mod .. " + 1", hl.dsp.window.fullscreen())
hl.bind(mod .. " + E", hl.dsp.layout("fit active"))

-- Open app
hl.bind(mod .. " + F", hl.dsp.exec_cmd(vars.browser))
hl.bind(mod .. " + T", hl.dsp.exec_cmd(vars.terminal))
hl.bind(mod .. " + M", hl.dsp.exit())
hl.bind(mod .. " + R", hl.dsp.exec_cmd(vars.menu))
hl.bind(mod .. " + ALT + S", hl.dsp.exec_cmd("spotify"))
hl.bind(mod .. " + D", hl.dsp.exec_cmd(vars.discord))

-- Move
hl.bind(mod .. " + H", hl.dsp.layout("move -col"))
hl.bind(mod .. " + L", hl.dsp.layout("move +col"))

-- Workspace focus (monitors)
hl.bind(mod .. " + P", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + U", hl.dsp.focus({ workspace = "e-1" }))

-- Text shenanigans
hl.bind(
	mod .. " + O",
	hl.dsp.exec_cmd(
		'cat /home/afkara/.tmp/waybar-dadjoke.txt | wl-copy --trim-newline && hyprctl dispatch sendshortcut "CTRL,V,"'
	)
)
hl.bind(
	mod .. " + B",
	hl.dsp.exec_cmd(
		'hyprctl dispatch sendshortcut "CTRL,C,"; '
			.. vars.shell_commands_path
			.. '/transform_gemini.nu trump "$(wl-paste)"'
	)
)
hl.bind(mod .. " + 3", hl.dsp.exec_cmd(vars.shell_commands_path .. '/get_random_swag.nu "idontgiveaswag"'))
hl.bind(
	mod .. " + Y",
	hl.dsp.exec_cmd(
		'sh -c \'hyprctl dispatch sendshortcut "CTRL,C," && "'
			.. vars.shell_commands_path
			.. '/search_dadjoke.nu" "$(wl-paste)" | wl-copy && hyprctl dispatch sendshortcut "CTRL,V,"\''
	)
)
hl.bind(
	mod .. " + 2",
	hl.dsp.exec_cmd(
		'hyprctl dispatch sendshortcut "CTRL,C,"; '
			.. vars.shell_commands_path
			.. '/get_random_swag.nu "$(wl-paste)" && hyprctl dispatch sendshortcut "CTRL,V,"'
	)
)
hl.bind(
	mod .. " + 7",
	hl.dsp.exec_cmd(
		'hyprctl dispatch sendshortcut "CTRL,C,"; '
			.. vars.shell_commands_path
			.. '/transform_gemini.nu semi "$(wl-pasta)"'
	)
)

-- Fuzzel picker
hl.bind(mod .. " + W", hl.dsp.exec_cmd("/home/afkara/.config/hypr/fuzzel-pick"))

-- Screenshot
hl.bind(mod .. " + SHIFT + S", hl.dsp.exec_cmd("wayfreeze & PID=$!; sleep .1; grimshot copy area; kill $PID"))

-- OCR
hl.bind(
	"SUPER + ALT + F",
	hl.dsp.exec_cmd(
		"wayfreeze & PID=$!; grimshot copy area; sleep 0.1; wl-paste --type image/png | tesseract stdin stdout | wl-copy; kill $PID"
	)
)

-- Move pane to workspace (monitor)
hl.bind("SUPER + ALT + U", hl.dsp.window.move({ workspace = "e-1" }))
hl.bind("SUPER + ALT + P", hl.dsp.window.move({ workspace = "e+1" }))

-- Open specific site
hl.bind("SUPER + ALT + C", hl.dsp.exec_cmd('firefox --new-window "chat.com"'))
hl.bind("SUPER + ALT + Y", hl.dsp.exec_cmd('firefox --new-window "youtube.com"'))
hl.bind("SUPER + ALT + N", hl.dsp.exec_cmd('firefox --new-window "search.nixos.org/packages"'))

-- Translate selection
hl.bind(
	"SUPER + ALT + T",
	hl.dsp.exec_cmd(
		'hyprctl dispatch sendshortcut "CTRL,C,"; firefox --new-window "https://translate.google.com/?sl=auto&tl=en&text=$(wl-paste)&op=translate"'
	)
)

-- Move
hl.bind("SUPER + ALT + H", hl.dsp.layout("swapcol l"))
hl.bind("SUPER + ALT + L", hl.dsp.layout("swapcol r"))

-- TODO: find good use since I am using scrolling now
hl.bind("SUPER + ALT + J", hl.dsp.window.move({ direction = "down" }))
hl.bind("SUPER + ALT + K", hl.dsp.window.move({ direction = "up" }))

-- Mouse resize
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Volume options for compatible keyboards
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
