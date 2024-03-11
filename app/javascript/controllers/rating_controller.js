import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  
  setRating(e) {
    const rating = e.currentTarget.dataset.rating;
    const ratingCategory = e.currentTarget.dataset.category;
    const rootElement = e.currentTarget.parentNode
    const ratingInput = rootElement.querySelector(`input[data-rating-target="${ratingCategory}_rating"]`); 

    if (ratingInput) {
      ratingInput.value = rating;
    }
  }
}

