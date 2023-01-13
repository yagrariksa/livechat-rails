import consumer from "channels/consumer"

var createObject = (object) => {
  var template = document.querySelector('template');

  var node = document.importNode(template.content, true);

  node.querySelector('div').className += ` msg-${object.pc}`;

  node.querySelector('div div small').innerText = object.owner;
  node.querySelector('div div span').innerText = object.message;
  node.querySelector('div div span').className += ` baloon-${object.pc}`;
  node.querySelectorAll('div div small')[1].innerText = object.time;

  var chatbox = document.querySelector('.chatbox');

  chatbox.appendChild(node)

  chatbox.scrollTop = chatbox.scrollHeight
}

consumer.subscriptions.create("ChatChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    createObject(data.object)
  }
});
