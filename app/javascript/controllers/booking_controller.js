import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["baseFare", "numberOfNights", "serviceFee", "totalAmount"]

  SERVICE_FEE  = 0.18;

  connect() {
    this.updateDetails();
  }

  updateDetails(){
    this.numberOfNightsTarget.textContent = this.numberOfNights();
    this.baseFareTarget.textContent = this.calculateBaseFare();
    this.serviceFeeTarget.textContent = this.calculateServiceFee();
    this.totalAmountTarget.textContent = this.calculateTotalAmount();
  }

  numberOfNights() {
    return 10;
  }

  calculateBaseFare() {
    return parseFloat((this.numberOfNights() * this.element.dataset.perNightPrice).toFixed(2));
  }

  calculateServiceFee() {
    return parseFloat((this.calculateBaseFare() * this.SERVICE_FEE).toFixed(2));
  }

  calculateTotalAmount() {
    return parseFloat((this.calculateBaseFare() + this.calculateServiceFee()).toFixed(2));
  }
}
