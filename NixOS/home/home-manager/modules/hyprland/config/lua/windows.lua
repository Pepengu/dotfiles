hl.on("hyprland.start", function()
--    hl.dispatch(hl.dsp.exec_cmd("brightnessctl s 451"))
--    hl.dispatch(hl.dsp.exec_cmd("capybar"))
    hl.dispatch(hl.dsp.exec_cmd("noctalia"))
    hl.dispatch(hl.dsp.exec_cmd("hyprpaper"))
    hl.dispatch(hl.dsp.exec_cmd("nm-applet --indicator"))
    hl.dispatch(hl.dsp.exec_cmd("ssh-agent"))
    hl.dispatch(hl.dsp.exec_cmd("blueman-applet"))
--    hl.dispatch(hl.dsp.exec_cmd("swayosd-server"))
    hl.dispatch(hl.dsp.focus({ workspace = 1 }))
    hl.dispatch(hl.dsp.exec_cmd("ghostty"))
    hl.dispatch(hl.dsp.focus({ workspace = 2 }))
    hl.dispatch(hl.dsp.exec_cmd("zen-beta"))
end)

hl.window_rule({
    name = "no-border-wtv1",
    match = { workspace = "w[t1]" },
    border_size = 0,
})
