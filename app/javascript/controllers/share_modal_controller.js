import { Controller } from "@hotwired/stimulus";

export default class extends Controller {

  copyLink() {
    navigator.clipboard.writeText(this.element.dataset.shareUrl).then(() => {
      alert("Copied to clipboard");
    });
  }

  whatsappShare() {
    // TODO: Implement on your own.
    window.open(`https://web.whatsapp.com:/send?text=${this.element.dataset.shareUrl}`);
  }


  twitterShare() {
    // TODO: Implement on your own.
  }

  facebookShare() {
    // TODO: Implement on your own.
  }

  emailShare() {
    // TODO: Implement on your own.
  }

  embedLink() {
    // TODO: Implement on your own.
  }

  messengerShare() {
    // TODO: Implement on your own.
  }

  messagesShare() {
    // TODO: Implement on your own.
  }
}
