import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["map"]

  connect() {
      console.log(this.mapTarget)
  }

  // show(event) {
  //   event.preventDefault()
  //   this.mapTarget.classList.remove("d-none")
  // }
    grow(event) {
    event.preventDefault()
    this.mapTarget.classList.toggle("map-open")
    this.mapTarget.classList.toggle("map-closed")
  }
}
