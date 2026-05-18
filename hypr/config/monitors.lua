local vars = require("config/variables")

hl.monitor({
	output   = vars.main_monitor,
	mode     = "1920x1080@144",
	position = "0x0",
	scale    = 1,
})

hl.monitor({
	output   = vars.second_monitor,
	mode     = "1920x1080@60",
	position = "1920x0",
	scale    = 1,
})
