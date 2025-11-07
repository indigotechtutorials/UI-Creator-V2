import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dark-mode-toggle"
export default class extends Controller {
  connect() {
    if (window.matchMedia("(prefers-color-scheme: dark)").matches) {
      document.body.classList.add("dark-mode")
    } else {
      document.body.classList.add("light-mode")
    }

  }
}
