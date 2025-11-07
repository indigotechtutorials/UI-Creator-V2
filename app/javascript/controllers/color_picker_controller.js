import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="color-picker"
export default class extends Controller {
  connect() {
    let input = this.element.querySelector("input")
    Coloris({
    themeMode: 'auto',
    format: 'hsl',
    onChange: (color, inputEl) => {
      console.log(`The new color is ${color}`);
    },
    el: this.element,
  });
  }
}
