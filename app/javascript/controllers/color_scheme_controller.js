import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="color-scheme"
export default class extends Controller {
  static values = { prefix: String }
  updateColor({ detail: { name, color }}) {
    // console.log("Updating", name, "To color", color)
    let varName = ""

    if (this.hasPrefixValue) {
      varName += `${this.prefixValue}-`
    }

    varName += name

    document.documentElement.style.setProperty(`--${varName}`, color);
  }
}
