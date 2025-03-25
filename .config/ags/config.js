import {create_bar} from "./src/layouts/bar.js"
import {create_tools} from "./src/layouts/tools.js"
import {Quicksettings} from "./src/layouts/quicksettings.js"


App.config({
    style: "./style.css",

    windows: [
        create_bar(),
        create_tools(),
    ],
})

export{}

