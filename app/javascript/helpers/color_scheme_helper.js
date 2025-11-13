import Color from 'color';
import { post } from "@rails/request.js"

const updateCSSVar = (eventName, varName, val, prefix) => {
  let colorChangeEv = new CustomEvent(eventName, { detail: { name: varName, color: val, prefix: prefix }})
  window.dispatchEvent(colorChangeEv)
}

export const updateColorScheme = (name, val, prefix) => {
  updateCSSVar("color-picker-change", name, val, prefix)
}

export const inputColorScheme = (input, prefix = null) => {
  updateColorScheme(input.name, input.value, prefix)
}

export const getContrastingColor = (color) => {
  const [h, s, l] = Color(color).hsl().array()
  const newLightness = l > 50 ? 20 : 80
  return Color.hsl(h, s, newLightness)
}

export const saveColorScheme = async (url, name, color) => {
  await post(url, { 
    body: {
      name: name,
      color: color,
    },
    responseKind: "turbo-stream",
  })
}

export const saveMultipleColors = async (url, multipleColors) => {
  await post(url, { 
    body: {
      multiple_colors: multipleColors
    },
    responseKind: "turbo-stream",
  })
}