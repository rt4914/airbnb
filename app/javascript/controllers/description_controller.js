import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
  }

  toggleDescriptionModal() {
    document.getElementById("description").click();
  }
}
