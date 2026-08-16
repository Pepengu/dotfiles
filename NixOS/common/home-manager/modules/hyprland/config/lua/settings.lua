hl.config({
    input = {
        kb_layout  = "us, ru",
        kb_options = "grp:win_space_toggle",

        follow_mouse = 1,

        sensitivity = 0,

        touchpad = {
            natural_scroll = true,
        },
    },

    general = {
        gaps_in       = 5,
        gaps_out      = { top = 5, left = 2, right = 2, bottom = 2 },
        border_size   = 1,
        layout        = "dwindle",
        allow_tearing = false,
    },

    decoration = {
        rounding = 10,

        blur = {
            enabled = false,
            size    = 1,
            passes  = 1,
        },
    },

    dwindle = {
        preserve_split = true,
    },
})

-- hl.curve("myBezier", { points = { {0.05, 0.9}, {0.1, 1.05} } })

-- hl.animation({ leaf = "windows",     enabled = true, speed = 8,  bezier = "myBezier" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 7,  bezier = "default",    style = "popin 80%" })
hl.animation({ leaf = "border",      enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8,  bezier = "default" })
hl.animation({ leaf = "fade",        enabled = true, speed = 7,  bezier = "default" })
hl.animation({ leaf = "workspaces",  enabled = true, speed = 6,  bezier = "default" })
