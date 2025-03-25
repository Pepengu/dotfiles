const audio = await Service.import("audio")
import brightness from './../services/brightness.js';
import { WiFi } from './wifi.js';

function wifi(){
    return Widget.CenterBox({
        center_widget: Widget.Box({
            margin: 10,
            height_request: 40,
            spacing: 50,
            children: [
                Widget.Button({
                    width_request: 40,
                    label: "",
                    class_name: 'extra_wifi_button',
                    onClicked: () => {
                        Utils.exec(Utils.HOME + "/.config/ags/src/widgets/wifi-menu.sh")
                    }
                }),
                Widget.Button({
                    width_request: 40,
                    label: "",
                    class_name: 'extra_bluetooth_button',
                    onClicked: () => {
                        Utils.exec("rofi-bluetooth")
                    }
                }),
                Widget.Button({
                    width_request: 40,
                    label: "⏻",
                    class_name: 'extra_power_button',
                    onClicked: () => {
                        Utils.exec(Utils.HOME + "/.config/ags/src/widgets/power-menu.sh")
                        //"rofi -show power-extra_-modi power-menu:" + 
                    }
                }),
            ],
        })
    })
}

function Volume(){
    return Widget.Box({
        margin: 10,
        spacing: 10,
        children: [
            Widget.Button({
                class_name: "extra_volume_button",
                on_clicked: () => audio.speaker.is_muted = !audio.speaker.is_muted,
                width_request: 40,
                child: Widget.Icon().hook(audio.speaker, self => {
                    const vol = audio.speaker.volume * 100;
                    var icon = [
                        [101, 'overamplified'],
                        [67, 'high'],
                        [34, 'medium'],
                        [1, 'low'],
                        [0, 'muted'],
                    ].find(([threshold]) => Number(threshold) <= vol)?.[1];
                    if(audio.speaker.is_muted){
                        icon = 'muted'
                    }
                    self.icon = `audio-volume-${icon}-symbolic`;
                    self.tooltip_text = `Volume ${Math.floor(vol)}%`;
                }),
            }),
            Widget.Slider({
                width_request: 200,
                class_name: "extra_volume_slider",
                step: 10,
                draw_value: false,
                on_change: ({value}) => {audio.speaker.volume = value; console.log(value)},
                value: audio.speaker.bind("volume"),
            }),
            Widget.Label({
                class_name: "extra_volume_label",
                setup: self => self.hook(audio.speaker, () => {
                    self.label = `${Math.floor(audio.speaker.volume*100)}%`
                }),
            })
        ]
    })
}

export function Brightness(){
    return Widget.Box({
        margin: 10,
        spacing: 10,
        children: [
            Widget.Button({
                class_name: "extra_brigtness_button",
                width_request: 40,
                child: Widget.Label({
                    label: "󰃞"
                }),
            }),
            Widget.Slider({
                width_request: 200,
                class_name: "extra_brigtness_slider",
                step: 10,
                draw_value: false,
                value: brightness.bind("screen-value"),
                on_change: self => brightness.screen_value = self.value,
            }),
            Widget.Label({
                class_name: "extra_brigtness_label",
                setup: self => self.hook(brightness, () => {
                    self.label = `${Math.floor(brightness.screen_value*100)}%`
                }),
            })
        ]
    })
}

export const Extra_Window = Widget.Box({
    vertical: true,
    class_name: 'extra_window',
    name: "extra_window",
    visible: false,
    children: [
        await WiFi(),
        wifi(),
        Volume(),
        Brightness(),
    ],
    setup: (self) => {
        self.keybind([], "Escape", (self, event) => {
            self.hide()
        })
        self.no_show_all = true
    }
})

export function Extra_Button(){
    const res = Widget.Box({
        class_name: "extra",
        child: Widget.Button({
            class_name: "button",
            label: "󰍜",
            onClicked: (self) => {
                const win = App.getWindow("tools-" + self.get_parent_window()?.get_screen().get_number())
                if(win?.get_visible()){
                    win?.hide()
                }
                else{
                    win?.show()
                }
            },
        })
    })

    return res
}


/* = () => Widget.Button({
                        onClicked: () => App.toggleWindow("quicksettings"),
                        className: "module quicksettings",
                        child: Widget.Box({
                            children: [
                            ],
                        }),
                    }).hook(App, (self, win, visible) => {
                        self.toggleClassName("active", win === "quicksettings" && visible);
                    })*/
