# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "@hotwired--stimulus.js" # @3.2.2
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin_all_from "app/javascript/helpers", under: "helpers"

pin "@rails/request.js", to: "@rails--request.js.js"

pin "stimulus-use" # @0.52.3
pin "color" # @5.0.2
pin "color-convert" # @3.1.2
pin "color-name" # @2.0.2
pin "color-string" # @2.1.2
