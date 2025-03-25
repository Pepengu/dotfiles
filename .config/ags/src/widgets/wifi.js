

export const WiFi_Window = Widget.Box({
    class_name: 'wifi_window',
    children: [
        Widget.Label({label:"Cum"})
    ]
})

export async function WiFi(){
//    const button = Widget.Button({
//        class_names: ["wifi", "bar_button"],
//        label: "󰍜",
//        onClicked: () => {
//            if(WiFi_Window.get_visible()){
//                WiFi_Window.hide()
//            }
//            else{
//                WiFi_Window.show()
//            }
//        },
//    })
    const network = await Service.import('network')

    const WifiIndicator = () => Widget.Box({
        children: [
            Widget.Icon({
                icon: network.wifi.bind('icon_name'),
            }),
            Widget.Label({
                label: network.wifi.bind('ssid')
                .as(ssid => ssid || 'Unknown'),
            }),
        ],
    })

    const WiredIndicator = () => Widget.Icon({
        icon: network.wired.bind('icon_name'),
    })

    const NetworkIndicator = () => Widget.Stack({
        children: {
            wifi: WifiIndicator(),
            wired: WiredIndicator(),
        },
        shown: network.bind('primary').as(p => p || 'wifi'),
    })

    return NetworkIndicator()
}

