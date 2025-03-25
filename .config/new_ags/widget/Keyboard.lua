local astal = require("astal")
local bind = astal.bind
local Widget = require("astal.gtk3.widget")
local Hyprland = require("lgi").require("AstalHyprland")

return function()
    return Widget.Label({
        setup = function(self)
            local dict = {}
            dict["Russian"] = "RU"
            dict["English (US)"] = "EN"

            local hypr = Hyprland.get_default()
            self:hook(hypr, 
                "keyboard-layout", 
                function(_, kbName, layoutName)
                    if not kbName then
                        return
                    end
                    
                    self.label = dict[layoutName]
                end)
        end,
        class_name = "KeyboardLayout",
    })
end
