import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="cancel-clicks"
export default class extends Controller {
  checkForClick(e) {
    if (this.element.contains(e.target)) {
      e.preventDefault()
    }
  }
}
