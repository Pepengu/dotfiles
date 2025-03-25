local astal = require("astal")

local App = require("astal.gtk3.app")
local Bar = require("widget.Bar")

local src = require("lib").src


local scss = src("style.scss")
local css = "/tmp/style.css"

astal.exec("sass " .. scss .. " " .. css)

App:start {
    css = css,
    main = function()
        Bar(0)
    end,
}
