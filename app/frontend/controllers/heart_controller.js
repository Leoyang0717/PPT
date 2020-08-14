
import { Controller } from "stimulus"
import ax from "axios"
import Rails from "@rails/ujs"
export default class extends Controller {
  static targets = ['heart']
  favorite() {
    // 發出事件
    const event = new CustomEvent("cat", {
      detail: {
        hazcheeseburger: 123
      }
    });
    window.dispatchEvent(event);
  }
}
    // let board_id = this.data.get("board")
    // Rails.ajax({
    //   url:`/boards/${board_id}/favorite.json`,
    //   type: 'POST',
    //   success: (result) => {
    //     if (result.status == true) {
    //       console.log(this)
    //       this.heartTarget.classList.remove("far");
    //       this.heartTarget.classList.add("fas");
    //     } else {
    //       this.heartTarget.classList.remove("fas");
    //       this.heartTarget.classList.add("far");
    //       }
    //   },
    //   error: (err) => {
    //     console.log(err)
    //   }
    // })


  //   const token = document.querySelector("meta[name=csrf-token]").content;
  //   ax.defaults.headers.common['X-CSRF-Token'] = token;

  //   ax.post(`/boards/${board_id}/favorite.json`)
  //   .then((result) => {
  //     if (result.data["status"] == true) {
  //       this.heartTarget.classList.remove("far");
  //       this.heartTarget.classList.add("fas");
  //     } else {
  //       this.heartTarget.classList.remove("fas");
  //       this.heartTarget.classList.add("far");
  //     }
  //   })
  //     .catch(function(err) {
  //       console.log(err);
  //     })
  // }

