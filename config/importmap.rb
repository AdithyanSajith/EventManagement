# config/importmap.rb

# Pin application entrypoint
pin "application"

# Hotwire (Turbo + Stimulus)
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

# Rails UJS (custom path to your downloaded file)
pin "@rails/ujs", to: "vendor/javascript/@rails--ujs.js"
