local vars = require("config/variables")

local enable_glass = vars.enable_glass

if enable_glass then
	hl.exec_cmd("hyprctl plugin load /home/afkara/.config/hypr/.pluginso/hyprglass.so")

	hl.exec_cmd("sleep 1")

	if hl.plugin.hyprglass then
		local hg = hl.plugin.hyprglass

		hg.config({
			enabled = true,
			default_theme = "dark",

			chromatic_aberration = 0.3,
			specular_strength = 1.0,
			fresnel_strength = 1.0,
			refraction_strength = 1.5,
			tint_color = 0x44112222,

			glass_opacity = 1.0,
			blur_strength = 0.2,
			layers = { enabled = true },
		})

		hg.layer("launcher", {
			default_preset = "glass",
		})

		hg.layer("waybar")
	end
end
