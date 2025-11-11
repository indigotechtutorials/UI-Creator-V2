import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="color-scheme"
export default class extends Controller {
  updateColor({ detail: { name, color }}) {
    // console.log("Updating", name, "To color", color)
    document.documentElement.style.setProperty(`--${name}`, color);
  }
}
