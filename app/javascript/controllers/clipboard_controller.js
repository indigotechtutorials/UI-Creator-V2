import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="clipboard"
export default class extends Controller {
  static values = { text: String }
  static targets = ["success"]

  copy(e) {
    e.preventDefault()
    navigator.clipboard.writeText(this.textValue).then(() => {
      console.log('Async: Copying to clipboard was successful!');
      this.successTarget.style.display = "flex"
      setTimeout(() => {
        this.successTarget.style.display = "none"
      }, 1000)
    }, (err) => {
      console.error('Async: Could not copy text: ', err);
    });
  }
}
