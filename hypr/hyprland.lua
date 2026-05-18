local mod = "SUPER"
local terminal = "wezterm"
local browser = "firefox"
local discord = "vesktop"
local filemanager = "yazi"
local wallpaper_manager = "wpaperd"
local waybar = "waybar"
local easyeffects = "easyeffects"
local main_monitor = "desc:Microstep MSI"
local second_monitor = "desc:HKC OVERSEAS LIMITED S01"
local shell_commands_path = "/home/afkara/.config/shell_commands"
local app_picker = "fuzzel"
local menu = "fuzzel"

hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("XCURSOR_SIZE", "12")
hl.env("HYPRCURSOR_SIZE", "12")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("NVD_BACKEND", "direct")

hl.on("hyprland.start", function ()
	hl.exec_cmd(wallpaper_manager)
	hl.exec_cmd(waybar)
	hl.exec_cmd(easyeffects)
	hl.exec_cmd(discord)
	hl.exec_cmd("hyprctl dispatch moveworkspacetomonitor 1 " .. second_monitor)
	hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme prefer-dark")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3")
end)

hl.monitor({
	output   = main_monitor,
	mode     = "1920x1080@144",
	position = "0x0",
	scale    = 1,
})

hl.monitor({
	output   = second_monitor,
	mode     = "1920x1080@60",
	position = "1920x0",
	scale    = 1,
})

hl.config({
	general = {
		layout = "scrolling",
		border_size = 2,
		gaps_in = 5,
		gaps_out = 10,
		allow_tearing = false,
		col = {
			active_border = { colors = {"rgba(34eb61ee)", "rgba(34bdebee)"}, angle = 135},
			inactive_border = "rgba(3a3a3aaa)",
		},
	},

	decoration = {
		rounding = 10,

		blur = {
			enabled = true,
			size = 10,
			passes = 3,
			vibrancy = 0.9,
		},

		shadow = {
			enabled = true,
			color = 0xee1a1a1a,
			range = 4,
			render_power = 3,
		},
	},

	animations = {
		enabled = true,
	},

	input = {
		kb_layout = "us",
		kb_variant = "workman",
		sensitivity = 0,
		follow_mouse = 1,
	},

	dwindle = {
		preserve_split = true,
	},

	master = {
		new_status = "master",
	},

	misc = {
		disable_hyprland_logo = true,
		force_default_wallpaper = 0,
	},
})

hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })

hl.workspace_rule({ workspace = "1", monitor = second_monitor })
hl.workspace_rule({ workspace = "2", monitor = main_monitor })
hl.workspace_rule({ workspace = "3", monitor = main_monitor })
hl.workspace_rule({ workspace = "4", monitor = main_monitor })
hl.workspace_rule({ workspace = "5", monitor = main_monitor })

hl.bind(mod .. " + Q", hl.dsp.window.close())
hl.bind(mod .. " + F", hl.dsp.exec_cmd(browser))
hl.bind(mod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mod .. " + M", hl.dsp.exit())
hl.bind(mod .. " + E", hl.dsp.exec_cmd(filemanager))
hl.bind(mod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mod .. " + D", hl.dsp.exec_cmd(discord))
hl.bind(mod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + 8", hl.dsp.window.move({ workspace = 9, silent = true }))
hl.bind(mod .. " + P", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + U", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mod .. " + O", hl.dsp.exec_cmd('cat /home/afkara/.tmp/waybar-dadjoke.txt | wl-copy --trim-newline && hyprctl dispatch sendshortcut "CTRL,V,"'))
hl.bind(mod .. " + B", hl.dsp.exec_cmd('hyprctl dispatch sendshortcut "CTRL,C,"; ' .. shell_commands_path .. '/transform_gemini.nu trump "$(wl-paste)"'))
hl.bind(mod .. " + 3", hl.dsp.exec_cmd(shell_commands_path .. '/get_random_swag.nu "idontgiveaswag"'))
hl.bind(mod .. " + Y", hl.dsp.exec_cmd('sh -c \'hyprctl dispatch sendshortcut "CTRL,C," && "' .. shell_commands_path .. '/search_dadjoke.nu" "$(wl-paste)" | wl-copy && hyprctl dispatch sendshortcut "CTRL,V,"\''))
hl.bind(mod .. " + 2", hl.dsp.exec_cmd('hyprctl dispatch sendshortcut "CTRL,C,"; ' .. shell_commands_path .. '/get_random_swag.nu "$(wl-paste)" && hyprctl dispatch sendshortcut "CTRL,V,"'))
hl.bind(mod .. " + 7", hl.dsp.exec_cmd('hyprctl dispatch sendshortcut "CTRL,C,"; ' .. shell_commands_path .. '/transform_gemini.nu semi "$(wl-paste)"'))
-- hl.bind(mod .. " + 1", hl.dsp.fullscreen())
hl.bind(mod .. " + W", hl.dsp.exec_cmd("/home/afkara/.config/hypr/fuzzel-pick"))

hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("wayfreeze & PID=$!; sleep .1; grimshot copy area; kill $PID"))
hl.bind("SUPER + ALT + F", hl.dsp.exec_cmd("wayfreeze & PID=$!; grimshot copy area; sleep 0.1; wl-paste --type image/png | tesseract stdin stdout | wl-copy; kill $PID"))

hl.bind("SUPER + ALT + U", hl.dsp.window.move({ workspace = "e-1" }))
hl.bind("SUPER + ALT + P", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind("SUPER + ALT + C", hl.dsp.exec_cmd('firefox --new-window "chat.com"'))
hl.bind("SUPER + ALT + Y", hl.dsp.exec_cmd('firefox --new-window "youtube.com"'))
hl.bind("SUPER + ALT + N", hl.dsp.exec_cmd('firefox --new-window "search.nixos.org/packages"'))
hl.bind("SUPER + ALT + S", hl.dsp.exec_cmd('firefox --new-window "https://open.spotify.com/"'))
hl.bind("SUPER + ALT + T", hl.dsp.exec_cmd('hyprctl dispatch sendshortcut "CTRL,C,"; firefox --new-window "https://translate.google.com/?sl=auto&tl=en&text=$(wl-paste)&op=translate"'))
hl.bind("SUPER + ALT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER + ALT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind("SUPER + ALT + J", hl.dsp.window.move({ direction = "down" }))
hl.bind("SUPER + ALT + K", hl.dsp.window.move({ direction = "up" }))

hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })

hl.window_rule({
	name  = "float-youtube",
	match = { class = "(.*[Yy]ou[Tt]ube.*)$" },
	float = true,
})

hl.window_rule({
	name  = "float-exe",
	match = { class = ".*%.exe" },
	float = true,
})

hl.window_rule({
	name  = "fullscreen-youtube",
	match = { title = ".*YouTube.*" },
	fullscreen = true,
})

hl.window_rule({
	name  = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	name  = "fix-xwayland-drags",
	match = {
		class      = "^$",
		title      = "^$",
		xwayland   = true,
		float      = true,
		fullscreen = false,
		pin        = false,
	},
	no_focus = true,
})

hl.window_rule({
	name  = "easyeffects-workspace",
	match = { class = ".*easyeffects" },
	workspace = "9",
})

hl.window_rule({
	name  = "tile-file-save",
	match = { title = ".*name of file to save to.*" },
	tile = true,
})

hl.window_rule({
	name  = "focused-opacity",
	match = { focus = true },
	-- active_opacity = 1.0,
})

hl.permission("/nix/store/[a-z0-9]{32}-xdg-desktop-portal-hyprland-[0-9.]*/libexec/.xdg-desktop-portal-hyprland-wrapped", "screencopy", "allow")
