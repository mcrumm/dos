import flatpickr from "flatpickr";

const Pickr = {
  buildConfig() {
    // Build the initial config map from the
    // `data-pickr-config` DOM attribute
    let config = (this.el.dataset.pickrConfig &&
      JSON.parse(this.el.dataset.pickrConfig)) || {}

    // Combine the config with a default dateFormat.
    // This also ensures the required `wrap: true`
    // option cannot be overwritten.
    return { dateFormat: "Y-m-d", ...config, wrap: true }
  },
  mounted() {
    const config = this.buildConfig()
    this.pickr = flatpickr(this.el, config)
    this.config = config
  },
  updated() {
    let config = this.buildConfig()
    let wasConfig = this.config
    if (config !== wasConfig) {
      this.pickr.destroy()
      this.pickr = flatpickr(this.el, config)
      this.config = config
    }
  },
  destroyed() {
    this.pickr.destroy()
  }
}

export default Pickr
