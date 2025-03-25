const hyprland = await Service.import("hyprland")
const systemtray = await Service.import("systemtray")
import {Battery} from "./../widgets/battery.js"
import {Extra_Button} from "./../widgets/extra.js"

const Workspaces = Widget.Box({
    class_name: "workspaces",
    children:
    Array.from({length: 5}, (_, i) => i + 1).map((id) =>
        Widget.Button({
            on_clicked: () => hyprland.messageAsync(`dispatch workspace ${id}`),
            child: Widget.Label(id < 6 ? `${Array("","󰈹","","󰭹","󰊗")[id-1]}` : ""),
            class_name: hyprland.active.workspace.bind("id").as(i => `${i === id ? "focused" : ""}`),
        })
    )
})

const Language = Widget.Label({
    label: (() => {
        const dict = {"Russian": "RU", "English (US)": "EN"}

        hyprland.connect("keyboard-layout", (_, __, layout) => {
            console.log(layout)
            Language.set_label(dict[layout])
        })

        return "EN"
    })(),
    class_name: "language",
})


const Clock = Widget.Label({
    label: Variable("", {
        poll: [1000, `date "+%a, %d %b, %H:%M"`],
    }).bind(),
    class_name: "clock"
})


function SysTray() {
    const items = systemtray.bind("items")
    .as(items => items.map(item => Widget.Button({
        class_names: ["tray", "item"],
        child: Widget.Icon({ 
            icon: item.bind("icon"),
        }),
        on_primary_click: (_, event) => item.activate(event),
        on_secondary_click: (_, event) => item.openMenu(event),
        tooltip_markup: item.bind("tooltip_markup"),
    })))

    return Widget.Box({
        children: items,
        class_name: "tray",
    })
}

function Left() {
    return Widget.Box({
        children: [
            Extra_Button(),
            Workspaces,
            Language,
        ],
    })
}

function Center() {
    return Widget.Box({
        children: [
            Clock,
        ],
    })
}

function Right() {
    return Widget.Box({
        hpack: "end",
        
        spacing: 8,
        children: [
            SysTray(),
            Battery(),
        ],
    })
}

export function create_bar(monitor = 0){
    return Widget.Window({
        name: `bar-${monitor}`,
        class_name: "bar",
        monitor,
        anchor: ["top", "left", "right"],
        exclusivity: "exclusive",
        child: Widget.CenterBox({
            start_widget: Left(),
            center_widget: Center(),
            end_widget: Right(),
        }),
    })
}
