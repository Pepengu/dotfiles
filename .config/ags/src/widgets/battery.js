import battery from "./../services/battery.js"

export function Battery(){
    const res = Widget.Box({
        class_name: "battery",
        spacing: 5,
        children: [
            Widget.Label({label: battery.bind("percent").as(p => `${p}%`)}),
            Widget.Label({label: battery.bind("icon").as(p => p)}),
        ]
    });

    if(battery.status == 'charging'){
        res.toggleClassName("charging", true) 
    }

    battery.connect("status-changed", (p) => {
        console.log(p.status)
        res.toggleClassName("charging", p.status == 'charging') 
    })

    battery.connect("low-power", (p) => {
        res.toggleClassName("critical", p.percent <= p.power_low_threshold) 
    })

    return res;
}
