import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
  }

  toggleShareModal() {
    document.getElementById("share").click();
  }
}
