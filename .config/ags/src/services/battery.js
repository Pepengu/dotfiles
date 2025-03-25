class BatteryService extends Service {
    static{
        Service.register(
            this,
            {
                'percent-changed': ['int'],
                'status-changed': ['string'],
                'icon-changed': ['string'],
                'low-power': ['boolean'],
            },
            {
                'percent': ['int', 'r'],
                'status': ['string', 'r'],
                'icon': ['string', 'r'],
                'power_low_threshold': ['int', 'rw'],
            },
        );


    }

    #battaries_amount = 2
    #power_low = false
    #power_low_threshold = 15
    #percent = 0
    #charging = true
    #icons = ["󰁻", "󰁼", "󰁾", "󰂀", "󰂂", "󰁹"]
    #icon = "󰁹"

    get percent(){
        return this.#percent
    }

    get icon(){
        return this.#icon
    }

    get status(){
        return this.#charging ? "charging" : "discharging"
    }

    get power_low_threshold(){
        return this.#power_low_threshold
    }

    set power_low_threshold(p){
        this.#power_low_threshold = p
    }

    constructor() {
        super();

        Utils.interval(1000, () => {
            this.#onPercentChange()
            this.#onStatusChange()
            this.#onIconChange()
        })
    }

    #onIconChange() {
        const currentIcon = this.#icons[Math.floor(this.#percent/18)]
        if(this.#charging){
            this.#icon = "󰂄"
            this.notify('icon');
            this.emit("icon-changed", this.#icon)
        }
        else if (currentIcon != this.#icon){
            this.#icon = currentIcon
            this.notify('icon');
            this.emit("icon-changed", this.#icon)
        }
    }

    #onPercentChange() {
        var batteryFull =  0
        var batteryNow = 0
        for (let i = 0; i < this.#battaries_amount; i++) {
            batteryFull += Number(Utils.exec(`cat /sys/class/power_supply/BAT${i}/energy_full`))
            batteryNow += Number(Utils.exec(`cat /sys/class/power_supply/BAT${i}/energy_now`))
        }
        
        const currentPercent = Math.floor(batteryNow / (batteryFull / 100))

        if(this.#percent != currentPercent){
            this.#percent = currentPercent
            this.emit('changed');
            this.notify('percent');
            this.emit("percent-changed", this.#percent)

            this.#onIconChange()

            if((this.#percent <= this.#power_low_threshold) != this.#power_low){
                this.#power_low = this.#percent <= this.#power_low_threshold
                this.emit('changed')
                this.emit('low-power', this.#power_low)
            }
        }
    }

    #onStatusChange(){
        var charging = false
        for (let i = 0; i < this.#battaries_amount; i++) {
            const status = Utils.exec(`cat /sys/class/power_supply/BAT${i}/status`)
            charging ||= status == "Charging"
        }


        if(this.#charging != charging){
            this.#charging = charging
            this.emit('changed');
            this.notify('status');
            this.emit("status-changed", this.#charging ? "charging" : "discharging")
            this.#onIconChange()
        }
    }
}

const battery = new BatteryService

export default battery
