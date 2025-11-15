import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="disable-onclick"
export default class extends Controller {
  static values = { text: String }
  disable(e) {
    e.target.disabled = true
    e.target.textContent = this.textValue
  }
}
