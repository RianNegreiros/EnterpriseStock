// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

window.initMap = () => {
  const event = new CustomEvent("map-loaded", {bubbles:true, cancelable:true})
  window.dispatchEvent(event)
}
