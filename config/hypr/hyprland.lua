require("globals")
require("appearance")
require("binds")
require("rules")

package.path = "./?.lua;" .. package.path

local external = "HDMI-A-1"
local internal = "eDP-1"

hl.config({
	general = {
		layout = "scrolling",
		resize_on_border = true,
		no_focus_fallback = true,
	},
	input = {
		kb_layout = "us, ua",
		kb_options = "grp:win_space_toggle",
	},
	scrolling = {
		fullscreen_on_one_column = true,
		follow_min_visible = 0,
	},
	misc = {
		initial_workspace_tracking = 2,
	},
	debug = {
		disable_logs = false,
	},
})

local function toggle_monitor()
	local m = hl.get_monitor(external)

	if m ~= nil then
		hl.monitor({ output = internal, disabled = true })
		return
	end

	hl.monitor({ output = internal, disabled = false })
end

hl.on("config.reloaded", toggle_monitor)
hl.on("monitor.added", toggle_monitor)
-- hl.on("monitor.removed", toggle_monitor)

hl.monitor({
	output = internal,
	mode = "1920x1080@60",
	position = "1920x0",
	scale = 1.25,
	disabled = true,
})

hl.monitor({
	output = external,
	mode = "1920x1080@74.97",
	bitdepth = 8,
})
