import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  
  setRating(e) {
    const rating = e.currentTarget.dataset.rating;
    const ratingCategory = e.currentTarget.dataset.category;
    const rootElement = e.currentTarget.parentNode
    const ratingInput = rootElement.querySelector(`input[data-rating-target="${ratingCategory}"]`); 

    const stars = rootElement.querySelectorAll(`[data-rating-target="star"]`); 

    stars.forEach(star => {
      if(star.dataset.rating <= rating){
        star.classList.remove('fill-gray-300')
        star.classList.add('fill-amber-300')
      }
      else{
        star.classList.remove('fill-amber-300')
        star.classList.add('fill-gray-300')
      }
    });

    if (ratingInput) {
      ratingInput.value = rating;
    }
  }
}

