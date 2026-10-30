local vars = require("config/variables")

hl.on("hyprland.start", function()
	hl.exec_cmd(vars.wallpaper_manager)
	hl.exec_cmd(vars.waybar)
	-- Trigger detection follows Workman; the virtual paste keyboard stays QWERTY.
	hl.exec_cmd("env XKB_DEFAULT_LAYOUT=us XKB_DEFAULT_VARIANT=workman vicinae server")
	hl.exec_cmd(vars.easyeffects)
	hl.exec_cmd(vars.discord)
	hl.exec_cmd("hyprctl dispatch moveworkspacetomonitor 1 " .. vars.second_monitor)
	hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme prefer-dark")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3")
end)
