local vars = require("config/variables")

hl.config({
	general = {
		layout = "scrolling",
		border_size = 2,
		gaps_in = 5,
		gaps_out = 10,
		allow_tearing = false,
		col = {
			active_border = { colors = { "rgba(34eb61ee)", "rgba(34bdebee)" }, angle = 135 },
			inactive_border = "rgba(3a3a3aaa)",
		},
	},

	decoration = {
		rounding = 10,

		blur = {
			enabled = not vars.enable_glass,
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

	master = {
		new_status = "master",
	},

	misc = {
		disable_hyprland_logo = true,
		force_default_wallpaper = 0,
	},
})
