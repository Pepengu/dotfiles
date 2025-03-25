local astal = require("astal")
local Widget = require("astal.gtk3.widget")
local Battery = astal.require("AstalBattery")
local bind = astal.bind

return function()
	local bat = Battery.get_default()


	return Widget.Box({
		class_name = "Battery",
		visible = bind(bat, "is-present"),
		Widget.Icon({
			icon = bind(bat, "battery-icon-name"),
		}),
		Widget.Label({
			label = bind(bat, "percentage"):as(function(p)
				return tostring(math.floor(p * 100)) 
			end),
		}),
	})
end
