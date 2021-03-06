
import { Controller } from "stimulus"
import Rails from "@rails/ujs"

window.Rails = require("@rails/ujs")


export default class extends Controller {
  static targets = [ "form" ]

  connect() {
  }

  next(event) {
    event.preventDefault()
    if(event.currentTarget.dataset.question < 4) {
      const index = Number.parseInt(event.currentTarget.dataset.question)
      const thisStep = document.getElementById(`question-${index}`)
      const nextStep = document.getElementById(`question-${index + 1}`)
      thisStep.classList.add('d-none')
      nextStep.classList.remove('d-none')
    } else {
      event.currentTarget.setAttribute("disabled", "")
      this.formTargets.forEach((form) => {
        Rails.fire(form, 'submit')
      })
    }
  }

}
