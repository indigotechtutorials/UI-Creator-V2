import { ApplicationController, useDebounce } from "stimulus-use"
import { post } from "@rails/request.js"

// Connects to data-controller="color-picker"
export default class extends ApplicationController {
  static values = { callbackUrl: String }
  static debounces = ["sendCallbackMessage"]

  initialize() {
    useDebounce(this, { wait: 200 })
  }

  async change(e) {
    let input = e.target
    let colorChangeEv = new CustomEvent("color-picker-change", { detail: { name: input.name, color: input.value}})
    window.dispatchEvent(colorChangeEv)
    this.sendCallbackMessage(input)
  }

  async sendCallbackMessage(input) {
      await post(this.callbackUrlValue, { 
      body: {
        name: input.name,
        color: input.value,
      },
      responseKind: "turbo-stream",
    })
  }
}
