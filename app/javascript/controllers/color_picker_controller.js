import { ApplicationController, useDebounce } from "stimulus-use"
import { post } from "@rails/request.js"

// Connects to data-controller="color-picker"
export default class extends ApplicationController {
  static targets = ["preview"]
  static values = { callbackUrl: String }
  static debounces = ["change"]

  initialize() {
    useDebounce(this, { wait: 200 })
  }

  async change(e) {
    let input = e.target
    this.previewTarget.style.backgroundColor = input.value
    await post(this.callbackUrlValue, { 
      body: {
        name: input.name,
        color: input.value,
      },
      responseKind: "turbo-stream",
    })
  }
}
