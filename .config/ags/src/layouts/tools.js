import { WiFi_Window } from "./../widgets/wifi.js"
import { Extra_Window } from "./../widgets/extra.js"

export function create_tools(monitor = 0){
    const button = Widget.Button({label: "cum"})
    const res = Widget.Window({
        name: `tools-${monitor}`,
        class_name: "tools",
        monitor,
        anchor: ["top", "left"],
        exclusivity: "ignore",
        margins: [36,0.5,0,0],
        keymode: "on-demand",
        visible: false,
        child: Widget.Box({
            spacing: 10,
            widthRequest: 1000,
            children: [
                Extra_Window,
                WiFi_Window,
            ],
            setup: (self) => {
                self.set_halign(1)
            }
        }),
        setup: (self) =>{
            self.connect("show", () => {
                self.child.children.map((child) => {child.hide()})
                Extra_Window.show()
            })

            self.keybind([], "Escape" , (self, event) => {
                self.hide()
            })
        },
    })

    return res
}
