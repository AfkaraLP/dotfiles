hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})
hl.window_rule({
	name = "wezterm_starting_width",
	match = { class = "wezterm" },
	scrolling_width = 1.0,
})

hl.layer_rule({ match = { namespace = "waybar" }, blur = true, ignore_alpha = 0.5 })
hl.layer_rule({ match = { namespace = "launcher" }, blur = true, ignore_alpha = 0.5 })

hl.permission(
	"/nix/store/[a-z0-9]{32}-xdg-desktop-portal-hyprland-[0-9.]*/libexec/.xdg-desktop-portal-hyprland-wrapped",
	"screencopy",
	"allow"
)
