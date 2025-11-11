import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="clipboard"
export default class extends Controller {
  static values = { text: String }

  copy(e) {
    e.preventDefault()
    navigator.clipboard.writeText(this.textValue).then(() => {
      
    }, (err) => {
      console.error('Async: Could not copy text: ', err);
    });
  }
}
