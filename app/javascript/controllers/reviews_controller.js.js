import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
  }

  toggleReviewsModal() {
    document.getElementById("reviews").click();
  }
}
