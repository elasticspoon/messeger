// Action Cable provides the framework to deal with WebSockets in Rails.
// You can generate new channels where WebSocket features live using the `bin/rails generate channel` command.

import { createConsumer } from "@rails/actioncable";

// export default createConsumer();
// export default createConsumer('ws://localhost:3000/cable');

function getWebSocketUrl() {
  const protocol = window.location.protocol === "https:" ? "wss:" : "ws:";
  const host = window.location.host;
  console.log("Attempting to create consumer");
  return `${protocol}//${host}/cable`;
}
export default createConsumer(getWebSocketUrl());
