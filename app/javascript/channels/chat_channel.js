import consumer from "channels/consumer"

consumer.subscriptions.create("ChatChannel", {
  connected() {
    alert("connected");
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    alert("recieve")
    console.log(data)
    // Called when there's incoming data on the websocket for this channel
  },

  send_message: function() {
    return this.perform('send_message');
  }
});
