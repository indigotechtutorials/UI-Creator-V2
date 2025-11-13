import { ApplicationController, useDebounce } from "stimulus-use"
import { updateColorScheme, getContrastingColor, saveMultipleColors } from "helpers/color_scheme_helper"

// Connects to data-controller="color-pallete-gen"
export default class extends ApplicationController {
  static values = { url: String }
  static debounces = ["save"]
  
  initialize() {
    useDebounce(this, { wait: 200 })
  }

  gen(e) {
    let input = e.target
    let color = input.value 
  
    let background = color
    let backgroundName = "internal-app-background"
    updateColorScheme(backgroundName, background) // run call to update color scheme with correct name and color
    let header = getContrastingColor(color).lighten(0.9).string(); // Make it lighter to stand out
    let headerName = "internal-app-header"
    updateColorScheme(headerName, header)
    let text       = getContrastingColor(color).lighten(0.7).string() // Make it lighter to stand out
    let textName = "internal-app-text"
    updateColorScheme(textName, text)

    // saveColorScheme(this.urlValue, "background", background)
    // saveColorScheme(this.urlValue, "header", header)
    // saveColorScheme(this.urlValue, "text", text)
    this.save([
      ["background", background], 
      ["header", header], 
      ["text", text],
    ])
  }

  save(multipleColors) {
    saveMultipleColors(this.urlValue, multipleColors)
  }
}