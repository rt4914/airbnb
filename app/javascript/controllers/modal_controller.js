import { Controller } from "@hotwired/stimulus"
import {enter, leave, toggle} from 'el-transition'

export default class extends Controller {
  connect () {
  }

  show(){
    enter(document.getElementById("modal-wrapper"));
  }

  hide(){
    leave(document.getElementById("modal-wrapper"));
  }
}

