import consumer from "channels/consumer";

const messageChannel = consumer.subscriptions.create(
  { channel: "MessageChannel", a_param: "some value" },
  {
    connected() {
      // Called when the subscription is ready for use on the server
      console.log(this);
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      // Called when there's incoming data on the websocket for this channel
      // console.log(data);
      const messageDisplay = document.querySelector("#message-display");
      messageDisplay.insertAdjacentHTML("beforeend", this.template(data));
    },

    template(data) {
      return `<article class="message">
      <div class="message-header">
        <p>${data.user.email}</p>
        </div>
        <div class="message-body">
        <p>${data.body}</p>
        </div>
        </article>`;
    },

    testMethod() {
      this.perform("test_method", { param1: "value1", param2: "value2" });
    },

    testSend() {
      this.send({ message: "Client is live" });
    },
  }
);

// document.addEventListener("turbo:load", () => {
//   let form = document.querySelector("#message-form");
//   if (form) {
//     form.addEventListener("submit", (e) => {
//       e.preventDefault();
//       let messageInput = document.querySelector("#message-input").value;
//       if (messageInput == "") return;
//       const message = {
//         body: messageInput,
//       };
//       messageChannel.send({ message: message });
//     });
//   }
// });
