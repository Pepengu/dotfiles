local Widget = require("astal.gtk3.widget")
local Anchor = require("astal.gtk3").Astal.WindowAnchor

local Workspaces = require("widget.Workspaces")
local Time = require("widget.Time")
local SysTray = require("widget.Tray")
local Battery = require("widget.Battery")
local Keyboard = require("widget.Keyboard")


return function(monitor)
    return Widget.Window({
        class_name = "Bar",
        monitor = monitor,
        anchor = Anchor.TOP + Anchor.LEFT + Anchor.RIGHT,
        exclusivity = "EXCLUSIVE",

        Widget.CenterBox({
			Widget.Box({
				halign = "START",
                -- Widget.Button({name = "quick_settings" }),
				Workspaces(),
                Keyboard(),
			}),
			Widget.Box({
				Time("%a, %d %b, %H:%M"),
			}),
			Widget.Box({
				halign = "END",
                SysTray(),
                Battery(),
			}),
		}),
    })
end
