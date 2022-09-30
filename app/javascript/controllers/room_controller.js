import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = [
    'bedFields',
    'beds'
  ]

  connect() {

  }

  addBed(e) {
    e.preventDefault();
    this.bedsTarget.insertAdjacentHTML(
      'beforeend',
      this.bedFieldsTarget.innerHTML
    )
  }
}