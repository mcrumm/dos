import flatpickr from "flatpickr";

const Pickr = {
  mounted() {
    this.pickr = flatpickr(this.el, {
      wrap: true,
      altInput: this.el.dataset.pickrAltFormat ? true : false,
      altFormat: this.el.dataset.pickrAltFormat || "d M Y",
      dateFormat: this.el.dataset.pickrDateFormat || "Y-m-d"
    })
  }
}

export default Pickr
