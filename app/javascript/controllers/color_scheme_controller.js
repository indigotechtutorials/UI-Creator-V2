import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="color-scheme"
export default class extends Controller {
  updateColor({ detail: { name, color, prefix }}) {
    let varName = ""

    if (prefix) {
      varName = `${prefix}-${name}`
    } else {
      varName = name
    }

    // console.log("Updating", name, "To color", color)
    document.documentElement.style.setProperty(`--${varName}`, color);
  }
}
