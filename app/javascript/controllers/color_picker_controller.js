import { ApplicationController, useDebounce } from "stimulus-use"
import { inputColorScheme, saveColorScheme } from "helpers/color_scheme_helper"

// Connects to data-controller="color-picker"
export default class extends ApplicationController {
  static values = { callbackUrl: String }
  static debounces = ["save"]

  initialize() {
    useDebounce(this, { wait: 200 })
  }

  change(e) {
    let input = e.target
    let prefix = e?.params?.prefix
    inputColorScheme(input, prefix)
    this.save(input)
  }

  save(input) {
     saveColorScheme(this.callbackUrlValue, input.name, input.value)
  }
}
