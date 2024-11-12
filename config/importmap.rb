# frozen_string_literal: true

pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true

pin_all_from Picket::Engine.root.join("app/javascript/lib/picket"), under: "picket", to: "lib/picket"
pin_all_from Picket::Engine.root.join("app/javascript/controllers"), under: "controllers"
pin_all_from Picket::Engine.root.join("app/javascript/helpers"), under: "helpers"
