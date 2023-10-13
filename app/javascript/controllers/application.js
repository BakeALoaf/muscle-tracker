import { Application } from "@hotwired/stimulus"

const application = Application.start()
//const context = require.context('/controllers', true, /\.js$/)

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
