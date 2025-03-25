import PopupWindow from "./../misc/popup.js"
import {Brightness} from "./../widgets/extra.js"

const battery = await Service.import("battery");

export const Indicator = ({ ...props }) =>
	Widget.Box({
		children: [
			Widget.Icon({
				icon: battery.bind("icon_name"),
				className: Utils.merge(
					[
						battery.bind("charging"),
						battery.bind("charged"),
						battery.bind("percent"),
					],
					(charging, charged, percent) => {
						if (charging || charged) return "green";
						if (percent < 30) return "red";
						return "";
					},
				),
			}),
			Widget.Label({
				label: battery.bind("percent").as((x) => `${x}%`),
			}),
		],
		visible: battery.bind("available"),
		...props,
	});

const Row = (toggles = [], menus = []) =>
    Widget.Box({
        vertical: true,
        children: [
            Widget.Box({
                homogeneous: true,
                children: toggles,
            }),
            ...menus,
        ],
    });

const Header = () =>
	Widget.Box({
		vertical: true,
		children: [
			Widget.Box({
				css: "margin-bottom: 12px",
				children: [
					Widget.Box({
						className: "avatar",
					}),
					Widget.Box({ hexpand: true }),
				],
			}),
		],
	});

export const Quicksettings = () =>
    PopupWindow({
        name: "quicksettings",
        exclusivity: "exclusive",
        transition: "slide_down",
        layout: "top-left",
        duration: 300,
        child: Widget.Box({
            vertical: true,
            className: "bgcont qs-container",
            children: [
                Header(),
                Brightness(),
                Indicator({ className: "qs-item" }),
                Widget.Label({
                    label: battery.bind("percent").as((x) => `${x}%`),
                })
            ],
        }),
    });
